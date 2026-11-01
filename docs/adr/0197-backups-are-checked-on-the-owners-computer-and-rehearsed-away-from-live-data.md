# 197. Backups are checked on the owner's computer and rehearsed away from live data

Proposed.

## Context

A backup nobody has tried to open may fail when it is needed, and a lost recovery secret is found out only at the worst
moment. A full test restore costs space and time, and one run against the live instance could damage it or bring a
second copy of the instance to life ([record 191](0191-a-restore-either-completes-or-stops-never-half-done.md)).

## Decision

Astrana Owner Tools prompts the owner periodically to verify their backups on their own computer, decrypting with the
recovery secret and checking the manifest, every hash, every row against Astrana's rules for each type, the checks that
detect tampering and the media, with no database at all. An occasional full rehearsal loads a backup into the second
database where the hosting plan has one, and into staging tables in the live database where it does not
([record 196](0196-every-restore-stages-inside-the-live-database-and-swaps-in-one-step.md)). A rehearsal is discarded,
never swapped in, never connected to peers and never changes the instance's identity. Each destination and each media
copy is checked periodically.

## Consequences

- Each verification also proves the owner still has their recovery secret.
- Cheap verification runs often and the expensive rehearsal rarely.
- A rehearsal cannot create a second copy of the instance.
- A second database is recommended where the plan allows, because a rehearsal there uses none of the live database's
  space, needs no rights on its tables and is dropped afterwards. An instance works fully with one.
- The owner sees the same steps either way, and only the report says where a rehearsal ran.
