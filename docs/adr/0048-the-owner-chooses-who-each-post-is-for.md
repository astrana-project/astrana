# 48. The owner chooses who each post is for

Proposed.

## Context

An owner's peers ([record 2](0002-connections-are-mutual-and-nobody-follows-anyone.md)) are not all the same, and not
everything is for everyone.

## Decision

Every post is shared with one or more audiences, which are named groupings of peers and guests.

## Consequences

- Astrana does not tell a peer that they were left out of an audience.
- A post goes to all connected peers unless the owner chooses otherwise, and the last audience used is remembered.
