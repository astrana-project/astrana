# 134. Moving an instance is a move, not a copy

Proposed.

## Context

An owner may need new hardware, or may change their mind about where to run their instance.

## Decision

Migration moves an instance, with the same identity and the same peers, to another machine or kind of hosting. It uses
backup and restore ([record 132](0132-an-instance-backs-itself-up-into-an-encrypted-archive.md)), and ends with the
original standing down.

## Consequences

- Choosing where to run an instance can be reversed, which is what makes it a real choice.
- For a while the same identity exists in two places, and that window is named, not hidden.
- Where a move changes the instance's address, its peers have to learn the new one.
- An original that has been lost or cannot be reached cannot stand down.
