# 133. A custodian sees peer content only where the owner allowed it in advance

Proposed.

## Context

What peers share reaches an instance for its owner. Other accounts on the instance exist for narrower jobs
([record 87](0087-an-account-gets-only-what-its-role-needs-settled-in-advance.md)). A guardian's access covers the peer
side of a child's instance
([record 92](0092-a-guardian-sees-the-peer-side-of-a-childs-instance-not-what-the-child-says.md)), and a guest never
sees what peers shared ([record 132](0132-a-guest-sees-the-owners-own-content-and-may-only-comment-and-react.md)). A
custodian preserves an instance for an owner who can no longer act, and the peers who shared with that owner did not
share with the custodian.

## Decision

On an instance, peer content is seen by its owner. A custodian sees it only where the owner enabled that in advance,
only once custodianship has taken effect, and only to read. Who sees peer content on an instance is enforced by that
instance.

## Consequences

- An owner decides while they can still act whether a custodian may later see what peers sent them, and a custodian
  cannot argue for more on the day.
- Without that choice, a custodian can preserve the instance without seeing anything peers shared.
- The instance the content came from plays no part in this, so a peer's own instance never needs to know who holds which
  account on the instance it shares with.
