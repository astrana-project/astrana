# 116. Phones are not pursued as host machines

Proposed.

## Context

Any device that can reliably run the supported system could run an instance
([record 61](0061-an-instance-may-run-on-the-owners-own-hardware-or-on-hosting-they-rent.md)), and a phone has the power
to do it.

## Decision

Nothing excludes a phone for being a phone. Astrana does not test, document or support hosting an instance on one.

## Consequences

- Phone operating systems suspend background work and change a phone's address as it moves, so an instance there would
  stop answering.
- There is no hosting adapter for a phone operating system.
