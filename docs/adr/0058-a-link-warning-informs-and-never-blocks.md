# 58. A link warning informs, and never blocks

Proposed.

## Context

A link can match a list of known bad links
([record 28](0028-links-are-checked-against-a-list-held-on-the-instance-never-by-sending-them-out.md)). Stopping a
person from opening it would protect them, and would also take a choice out of their hands.

## Decision

A link that matches a bad-link list is flagged to the person, and is never blocked.

## Consequences

- The choice stays with the person, who has the warning in front of them.
- A person can still open a dangerous link.
- A link that matches by mistake never stops anything.
- Blocking was rejected, because lists of bad links contain false matches, and the person, not the list, is in charge of
  what they open.
