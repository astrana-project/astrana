# 118. A link to content grants no access

Proposed.

## Context

An owner may send a link to something on their instance through another app. Access is checked by the instance that
holds the content ([record 89](0089-access-is-enforced-by-the-instance-that-holds-the-content.md)).

## Decision

Sending a link to content outside Astrana gives nobody access. Whoever opens it must already be allowed to see the
content. Anyone else gets a plain refusal that reveals nothing about what is behind it.

## Consequences

- A link can be passed around without exposing what it points to.
- Sending a link is logged, because it takes a reference to content outside Astrana.
