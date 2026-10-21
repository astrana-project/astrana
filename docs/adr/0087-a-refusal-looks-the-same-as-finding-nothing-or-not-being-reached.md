# 87. A refusal looks the same as finding nothing or not being reached

Proposed.

## Context

A peer may decline a request ([record 44](0044-a-request-to-a-peer-is-a-request-never-a-demand.md)), and telling the
requester so would itself say something.

## Decision

To the instance asking, a refusal, a request that matched nothing and an instance that could not be reached look the
same.

## Consequences

- Declining never discloses a private choice, or tells someone they were singled out.
- This applies to the one asking. An owner looking at their own instance is always told which it was.
- A former peer is the exception. A request after a disconnection is refused with its reason, because they already know
  the instance and its owner.
