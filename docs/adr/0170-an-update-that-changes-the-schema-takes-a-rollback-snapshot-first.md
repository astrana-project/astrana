# 170. An update that changes the schema takes a rollback snapshot first

Proposed.

## Context

Schema migrations only move forwards ([record 168](0168-schema-migrations-run-under-credentials-of-their-own.md)), so an
update whose schema migration fails part way needs a way back. Backups are something the owner turns on
([record 130](0130-an-instance-backs-itself-up-into-an-encrypted-archive.md)), and an owner who has not turned them on
would otherwise have none.

## Decision

An update that changes the database schema takes a local rollback snapshot of the database before its schema migrations
run, whatever the owner has chosen about automatic backups. The snapshot is deleted once the update succeeds.

## Consequences

- A failed update can always be undone, for every owner.
- The snapshot is not a backup, because it is kept on the same machine, and it is never presented as one.
- An update needs enough free space for the snapshot, and refuses to start when there is not enough.
- Relying on the owner's own backups was rejected because many owners will not have turned them on.
