# 20. Each person is represented by one instance

Proposed.

## Context

An instance represents the person it belongs to
([record 1](0001-each-instance-has-one-owner-who-is-its-sole-administrator.md)). Peers connect to it because they know
that person. A second live copy of an instance would be a clone, one identity in two places, which every peer would
treat as the person they knew. A second instance owned by the same person would be a second identity, letting one person
appear to their peers as two.

## Decision

Each person is represented by one instance at any time. The design avoids clones and second instances as far as it can,
and does not claim to prevent them.

## Consequences

- Astrana adds friction against clones and second instances where it can do so without costing the owner's privacy or
  autonomy. The supported way to change hardware is a move, in which the original stops acting as the instance, and an
  accidental clone is made hard to produce.
- A peer that talks to both copies of a deliberate clone may notice one identity answering from two places.
- Astrana cannot rule out a second instance or a deliberate clone. The known ways of enforcing one instance per person,
  such as checking at install or a registry that counts instances, would cost that privacy and autonomy.
- A second instance has little to offer honest use. One installed fresh starts as a new identity with no peers, no
  history and no standing. What it could be used for, such as appearing to peers as two people or returning as a new
  peer after being disconnected, is a threat between peers that Astrana has to reckon with.
- Looking after someone else's instance is not owning it. A parent or a helper who sets up or looks after a relative's
  instance is not represented by it.
