# 115. An instance never stores a peer's content, and holds it only in memory, checking with the sharer before each use

Proposed.

## Context

Content shared between peers ([record 2](0002-connections-are-mutual-and-nobody-follows-anyone.md)) could be copied onto
every instance that reads it, or fetched from where it lives each time it is shown
([record 72](0072-peers-exchange-plain-requests-over-https-with-no-persistent-connection-between-them.md)). The choice
decides who holds whose data. Downloading the same photo or video again on every view also costs the viewer delay and
the sharer load.

## Decision

An instance never writes content it loads from another instance to disk. It may hold that content in a memory cache,
encrypted under a short-lived key kept in memory that is locked against being swapped out. When the system announces
sleep or hibernation, the key is destroyed, and after resuming the cache is treated as empty.

Before every use of a cached post, profile or photo, the viewer's instance asks the instance that shared it whether the
item still exists, has not expired and is still for this peer, and checks it against the account asking. Only the bytes
already in memory are reused. Whether the item may be shown is decided fresh on every view, and if the sharer cannot be
reached, nothing is shown.

The only things kept about a peer are what is needed to reach them safely, namely a label, their key and its
fingerprint, their address, the state of the connection and when things happened.

## Consequences

- Content stays with the person who shared it, and no instance piles up copies of anyone else's.
- An item that was changed, deleted, expired or withdrawn from this peer is dropped from memory the next time it is
  asked for.
- When a peer is offline their content cannot be shown, with no older copy to fall back on. The interface says so, and
  never presents an unreachable peer as a peer with nothing to show.
- Content can reach disk without being written there, through swap, hibernation, crash dumps, temporary files written by
  libraries and logs. Each of these is handled, the web server's memory is cleared as it is returned, and peer content
  is sent to the browser marked so that neither the browser nor its service worker keeps it.
- The key lives in the same process as the cache, so encryption protects what reaches disk once the key is destroyed,
  and nothing against someone reading the running process. Notice of sleep is not guaranteed on any platform, so disk
  encryption remains the complete protection.
- The cache has a bounded memory budget. When everything in it is in use, new items pass through uncached, which slows
  viewing and never stops it.
- No third instance or always-on server holds a copy, so each person's data stays under their own control.
- Fetching every item again on every view was rejected, because asking the sharer whether an item may still be shown
  keeps every protection a fresh fetch gives, and downloading bytes already held adds only delay and load.
- A cache on disk was rejected, because a copy on disk can outlast a deletion or a change of audience.
- This is a commitment built into the code, not a setting an owner can change.
