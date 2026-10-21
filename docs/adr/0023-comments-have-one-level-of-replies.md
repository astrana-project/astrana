# 23. Comments have one level of replies

Proposed.

## Context

Comments respond to something an owner shared, and all point back to it. A discussion branches into sub-topics, and
needs deeper nesting to carry them.

## Decision

A comment may have replies, and a reply may not have replies of its own. Astrana has comments, not branching discussion.

## Consequences

- Each top-level comment becomes a topic with its own replies beneath it.
- A conversation that wants to become a branching discussion has nowhere to go here.
- Indentation stays usable on a small screen and modest hardware.
