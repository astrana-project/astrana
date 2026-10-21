# 20. Astrana is built on one instance per person, running as one live copy

Proposed.

## Context

An instance represents the person it belongs to
([record 1](0001-each-instance-has-one-owner-who-is-its-sole-administrator.md)) and serves them and the few people
around them. Peers connect to it because they know that person. A second live copy of an instance would be a clone, one
identity in two places, which every peer would treat as the person they knew. A second instance owned by the same person
would be a second identity, letting one person appear to their peers as two.

## Decision

Each person is represented by one instance at any time, running as one copy of the application with one database. An
instance is not spread across several servers. The design avoids clones as far as it can, and does not claim to prevent
them.

## Consequences

- Nothing has to keep several copies of the application in step.
- Astrana adds friction against clones and second instances where it can do so without costing the owner's privacy or
  autonomy. The supported way to change hardware is a move, in which the original stops acting as the instance.
- Astrana cannot rule out a second instance or a deliberate clone. The known ways of enforcing one instance per person,
  such as checking at install or a registry that counts instances, would cost that privacy and autonomy.
- A second instance has little to offer honest use. One installed fresh starts as a new identity with no peers, no
  history and no standing.
- Resilience comes from backups, not from a second live copy.
- Running someone else's instance is not owning it. A parent or a helper who operates a relative's instance is not
  represented by it.
- Spreading one instance across several servers was rejected, because it would add coordination, machines and upkeep for
  an owner who usually looks after the instance alone.
