# 93. Access is enforced by the instance that holds the content

Proposed.

## Context

Who may see a post is set by its owner ([record 48](0048-the-owner-chooses-who-each-post-is-for.md)), and that has to be
enforced somewhere.

## Decision

The instance holding content checks who may see it before returning anything, for feeds and for search alike. A
requester is never sent material and trusted to filter it.

## Consequences

- Modified software on the other side cannot see more than its owner is entitled to, because the filtering never happens
  on its side.
- Every view needs a live request that the holding instance answers, and the holding instance does the checking work for
  each one. Nothing can be shown while it is unreachable.
- Sending content encrypted to everyone and letting keys decide who can read it was rejected, because anyone who
  received it would keep it, and a change of audience could never take back what had already been sent.
