# 18. The feed is chronological and never ranked

Proposed.

## Context

A feed ranked by an algorithm decides what a person sees, and rewards whatever travels well.

## Decision

The feed shows what connected peers shared, in the order they shared it. Nothing ranks, boosts or weights it.

## Consequences

- Nothing is selected for travelling well, so content spreads only when a person chooses to pass it on.
- Feeds from outside sources have their own place and are never mixed in, because a feed holding two kinds of thing
  invites ranking them.
- Filters narrow the view a person chooses, and the feed does not remember them.
- A peer who shares a lot fills more of the feed, and nothing evens it out.
