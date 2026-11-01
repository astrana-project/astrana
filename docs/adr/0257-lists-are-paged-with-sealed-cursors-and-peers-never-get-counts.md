# 257. Lists are paged with sealed cursors, and peers never get counts

Proposed.

## Context

The feed and every other list load a page at a time
([record 47](0047-the-feed-loads-a-page-at-a-time-and-says-when-there-is-no-more.md)), and peers ask each other for
lists of posts, photos and more ([record 51](0051-a-request-to-a-peer-is-a-request-never-a-demand.md)). A total count
tells the asker how much someone has, and a cursor built from a creation time reveals exact creation times to whoever
can read it.

## Decision

Every list is paged with a cursor, in one standard form throughout. The cursor is sealed with the instance's own keys,
so the browser and peers can hand it back and never read it. No total count goes to a peer. Each list declares which
sorts and filters it allows.

## Consequences

- A peer cannot learn how many posts or photos someone has, or when exactly each was made.
- A list allows only the sorts it declares, so the feed stays chronological.
- Each list's paging is the same for the browser and for peers, so it is built and tested once.
