# 40. The feed loads a page at a time and says when there is no more

Proposed.

## Context

A chronological feed ([record 18](0018-the-feed-is-chronological-and-never-ranked.md)) could still scroll forever, which
leaves no natural place to stop.

## Decision

The feed loads one page at a time, with a deliberate action to load the next. When there is nothing more, it says so
plainly, and never fills the space with old content to look new.

## Consequences

- There is a natural stopping point.
- The end of the feed distinguishes nothing more from something on a peer that cannot be reached.
