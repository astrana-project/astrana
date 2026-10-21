# 114. What an instance finds about its hosting environment is told to its owner, and nobody else

Proposed.

## Context

An instance can learn things about the machine it runs on, such as whether its data is really encrypted
([record 61](0061-an-instance-may-run-on-the-owners-own-hardware-or-on-hosting-they-rent.md)). That knowledge could
inform the owner, stop the instance running, or be passed to peers.

## Decision

What an instance finds about its hosting environment is told to its owner. It is never used to refuse to run, and never
reported to peers.

## Consequences

- An owner who chooses a weak hosting environment is told plainly, and the choice stays theirs.
- Peers never learn how well another owner's instance is set up.
