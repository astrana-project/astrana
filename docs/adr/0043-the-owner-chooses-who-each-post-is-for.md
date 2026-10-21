# 43. The owner chooses who each post is for

Proposed.

## Context

An owner's peers ([record 2](0002-connections-are-mutual-and-nobody-follows-anyone.md)) are not all the same, and not
everything is for everyone.

## Decision

Every post is shared with one or more audiences, which are named groups of peers and guests. By default a post goes to
all connected peers, and the last audience used is remembered.

## Consequences

- A peer left out of an audience is never told, so leaving someone out never becomes a social signal.
