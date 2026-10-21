# 86. Access is enforced by the instance that holds the content

Proposed.

## Context

Who may see a post is set by its owner ([record 43](0043-the-owner-chooses-who-each-post-is-for.md)), and that has to be
enforced somewhere.

## Decision

The instance holding content checks who may see it before returning anything, for feeds and for search alike. A
requester is never sent material and trusted to filter it.

## Consequences

- Modified software on the other side cannot see more than its owner is entitled to, because the filtering never happens
  on its side.
