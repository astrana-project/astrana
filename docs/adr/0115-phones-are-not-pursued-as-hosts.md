# 115. Phones are not pursued as hosts

Proposed.

## Context

Any device that can reliably run the supported system could host an instance
([record 60](0060-an-instance-may-run-on-the-owners-own-hardware-or-on-hosting-they-rent.md)), and a phone has the power
to do it.

## Decision

Nothing excludes a phone for being a phone. Astrana does not test, document or support hosting an instance on one.

## Consequences

- Phone operating systems suspend background work and change a phone's address as it moves, so an instance there would
  stop answering.
- This is a decision about where effort goes, not about what could work, and whether to test it remains open.
