# 252. An update that changes the schema takes a rollback copy of the database first

Proposed.

## Context

Schema migrations only move forwards
([record 244](0244-only-astrana-owner-tools-can-change-the-database-schema-and-only-when-the-owner-applies-it.md)), so
an update whose schema migration fails part way needs a way back. Backups are something the owner turns on
([record 181](0181-the-instance-makes-scheduled-backups-and-astrana-owner-tools-makes-manual-ones-verifies-and-restores.md)),
and an owner who has not turned them on would otherwise have none.

## Decision

An update that changes the database schema takes a local rollback copy of the database before its schema migrations run,
whatever the owner has chosen about automatic backups. Astrana Owner Tools takes the copy as part of applying the schema
migrations, and deletes it once the update succeeds.

## Consequences

- A failed schema migration can always be undone, for every owner.
- The copy is not a backup, because it is kept on the same machine, and it is never presented as one.
- An update needs enough free space for the copy, and refuses to start when there is not enough.
- Taking the copy makes every update that changes the schema take longer.
- While the update runs, a second copy of the owner's data, personal data included, is held on disk.
- Relying on the owner's own backups was rejected because many owners will not have turned them on.
