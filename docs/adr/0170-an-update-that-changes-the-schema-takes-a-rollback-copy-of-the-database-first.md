# 170. An update that changes the schema takes a rollback copy of the database first

Proposed.

## Context

Schema migrations only move forwards ([record 168](0168-schema-migrations-run-under-credentials-of-their-own.md)), so an
update whose schema migration fails part way needs a way back. Backups are something the owner turns on
([record 132](0132-an-instance-backs-itself-up-into-an-encrypted-archive.md)), and an owner who has not turned them on
would otherwise have none.

## Decision

An update that changes the database schema takes a local rollback copy of the database before its schema migrations run,
whatever the owner has chosen about automatic backups. The copy is deleted once the update succeeds.

## Consequences

- A failed update can always be undone, for every owner.
- The copy is not a backup, because it is kept on the same machine, and it is never presented as one.
- An update needs enough free space for the copy, and refuses to start when there is not enough.
- Relying on the owner's own backups was rejected because many owners will not have turned them on.
