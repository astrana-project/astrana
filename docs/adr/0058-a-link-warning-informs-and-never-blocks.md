# 58. A link warning informs, and never blocks

Proposed.

## Context

A link can match a list of known bad links
([record 28](0028-links-are-checked-against-a-list-held-on-the-instance-never-by-sending-them-out.md)).

## Decision

A link that matches a bad-link list is flagged to the person, and is never blocked.

## Consequences

- The choice stays with the person, who has the warning in front of them.
