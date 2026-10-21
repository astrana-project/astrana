# 2. Astrana is built on one instance per person, running as one live copy

Proposed.

## Context

An instance represents the person it belongs to (record 1) and is meant to be treated as an extension of their real
self. Peers connect to it because they know that person. A second live copy of an instance would be a clone, one
identity in two places, which every peer would treat as the person they knew. A second instance owned by the same
person would be a second identity, letting one person appear to their peers as two.

## Decision

Astrana is built on the basis that each person is represented by one instance at any time, running as one live copy of
the application with one database. The design avoids clones as far as it can, and does not claim to prevent them.

## Consequences

- Astrana adds friction against clones and second instances where it can do so without costing the owner's privacy or
  autonomy. The supported way to change hardware is a move, in which the original stops acting as the instance, an
  accidental clone is made hard to produce, and a peer that talks to both copies of a deliberate clone may notice one
  identity answering from two places.
- Astrana cannot rule out a second instance or a deliberate clone. The known ways of enforcing one instance per person,
  such as checking at install or a registry that counts instances, would cost that privacy and autonomy.
- A second instance has little to offer honest use. One installed fresh starts as a new identity with no peers, no
  history and no standing. What it could be used for, such as appearing to peers as two people or returning as a new
  peer after a ban, is a threat Astrana has to reckon with between peers.
- Astrana provides resilience through backups, not through a second live copy.
- Running someone else's instance is not owning it. A parent or a helper who operates a relative's instance is not
  represented by it.
- Spreading one instance across several servers was rejected. It would not create a clone, but it would add
  coordination, machines and upkeep for an owner who usually looks after the instance alone, to remove downtime the
  design already treats as routine.
