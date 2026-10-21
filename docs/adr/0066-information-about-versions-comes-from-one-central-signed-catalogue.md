# 66. Information about versions comes from one central, signed catalogue

Proposed.

## Context

Owners on a network that nobody runs
([record 32](0032-every-instance-is-managed-by-its-owner-and-nobody-else-operates-it.md)) still need to learn which
versions exist, whether theirs is safe, and which versions can work together. Some of that cannot be answered in a
decentralised way, because it needs one authoritative statement.

## Decision

Instances regularly check the version catalogue, which the project maintains and signs. They send nothing about
themselves when they check. It tells an instance which versions exist on its release channel, whether an update is
mandatory and why, and how to verify a build.

## Consequences

- It is the one deliberate exception to decentralisation in Astrana.
- An instance trusts only what is signed, so nobody between the instance and the project can substitute a version of
  their own.
- Nothing on the network forces an update, even a mandatory one.
- The rules that vary by country travel the same way, because they are the same kind of problem, and so the exception
  stays at one.
- Anything proposed for the catalogue later must pass the same test, that there is no decentralised way to provide it.
