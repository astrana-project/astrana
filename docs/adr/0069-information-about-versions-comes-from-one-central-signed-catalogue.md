# 69. Information about versions comes from one central, signed catalogue

Proposed.

## Context

Owners on a network that nobody runs
([record 35](0035-every-instance-is-managed-by-its-owner-and-nobody-else-operates-it.md)) still need to learn which
versions exist, whether theirs is safe, and which versions can work together. Some of that cannot be answered in a
decentralised way, because it needs one authoritative statement.

## Decision

Instances regularly check the version catalogue, which the project maintains and signs. A check sends nothing that
identifies the instance or its owner. The catalogue tells an instance which versions exist on its release channel,
whether an update is mandatory and why, and how to verify a build.

## Consequences

- It is the one exception to decentralisation in Astrana.
- An instance trusts only what is signed, so nobody between the instance and the project can substitute a version of
  their own.
- A check still reveals the instance's network address, and when it checks, to whoever serves the catalogue.
- Nothing on the network forces an update, even a mandatory one. Mandatory tells the owner how serious an update is.
- If the signing key were lost or compromised, every instance would be affected, and while the project's server is
  unreachable, no instance learns of new versions.
- Anything proposed for the catalogue later must pass the same test, that there is no decentralised way to provide it.
