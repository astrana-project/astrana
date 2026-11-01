# 73. Information about versions comes from one central, signed catalogue

Proposed.

## Context

Owners on a network that nobody runs
([record 35](0035-every-instance-is-managed-by-its-owner-and-nobody-else-operates-it.md)) still need to learn which
versions exist, whether theirs is safe, and which versions can work together. Some of that cannot be answered in a
decentralised way, because it needs one authoritative statement. With no central server to attack, an attacker's best
route to every instance is a malicious update, so the way instances learn of versions is one of the most important
security controls Astrana has.

## Decision

Instances check the version catalogue, which the project maintains and signs, once a day at a random time within the
day. A check sends nothing that identifies the instance or its owner. The catalogue tells an instance which versions
exist on its release channel, whether an update is mandatory and why, and how to verify a build. It follows the model of
The Update Framework (TUF), with separate signing roles, rotation of its master key, and recovery after a compromise.

## Consequences

- It is the one exception to decentralisation in Astrana.
- An instance trusts only what is signed, so nobody between the instance and the project can substitute a version of
  their own. TUF also guards against being sent an older catalogue, being kept on a stale one, and being given a mix of
  metadata from different moments.
- The statement of which metadata is current stays valid for longer than the interval between checks, so an instance
  that was offline for a while does not mistake an old statement for an attack. The exact length is set when the client
  is built.
- Checking at a random time spreads the load on whoever serves the catalogue.
- A check still reveals the instance's network address, and when it checks, to whoever serves the catalogue.
- The catalogue informs and never acts on an instance. An instance whose owner declines a mandatory update past its
  grace period limits itself, by taking on no new commitments and consuming no peer content, and never holds back the
  owner's own data.
- Whoever holds the signing keys can speak to every instance, so the keys are the most valuable thing the project holds.
- While the project's server is unreachable, no instance learns of new versions.
- Anything proposed for the catalogue later must pass the same test, that there is no decentralised way to provide it.
- The catalogue design without TUF's role separation, master key rotation and recovery was rejected, because a single
  compromised key could then not be contained.
