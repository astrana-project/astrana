# 83. A guardian sees the peer side of a child's instance, not what the child says

Proposed.

## Context

A guardian needs enough to keep a child safe
([record 34](0034-when-a-child-owns-an-instance-a-parent-or-guardian-holds-authority-over-its-parental-controls.md)).
Harm to a child usually reaches them from someone else, and reading a child's own conversations would go far beyond
what keeping them safe needs.

## Decision

A guardian's standing access covers the peer side of the child's instance only. That is who the child is connected to,
those peers' profiles, and what those peers send to the child, graduated by the child's age bracket. A guardian also
sees an outline of the child's activity, such as who they interact with and how often. The child's own content and feed
are not part of this access.

## Consequences

- Reports about the child's content, raised by people who see it, are the one exception, and a guardian always sees
  them, because they concern a situation the guardian is responsible for.
- What a guardian may see is enforced on the child's instance, and the instance a peer's content comes from plays no
  part in it.
- How much of what peers send a guardian sees changes as the child moves from one age bracket to the next.
- A guardian sees what peers send to the child but never answers or reacts to it.
