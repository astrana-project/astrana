# 55. Signals about a peer inform the owner and never act by themselves

Proposed.

## Context

An instance can notice things about a peer ([record 2](0002-connections-are-mutual-and-nobody-follows-anyone.md)), such
as a burst of connection requests, or a peer that is often unreachable.

## Decision

Astrana never judges a peer. What it notices is shown to the owner, who decides what it means. What counts as a peer
behaving badly is the owner's call, and a private note the owner makes about a peer stays on their instance.

## Consequences

- No automated assessment removes, limits or labels anyone.
- The owner who approved several suspicious connections in one afternoon is the person the signal is shown to, which is
  the right person and also the limit.
