# 136. The instance makes scheduled backups, and Astrana Owner Tools makes manual ones, verifies and restores

Proposed.

## Context

An owner's data lives on one instance, and hardware fails. The backup key is separate from the instance's other keys
([record 128](0128-the-identity-database-and-backup-keys-are-independent.md)). A restore rebuilds the database's
structure as well as its data, which needs database credentials that may change the schema, and the running application
is never given those.

## Decision

An instance backs up its configuration, its database and the files it manages on a schedule the owner sets, into
encrypted archives that it cannot itself read. Astrana Owner Tools makes manual backups, including while the instance is
stopped, verifies archives and performs every restore. The instance never restores itself.

## Consequences

- The instance is always running and already reads everything a backup needs, so scheduled backups need no other program
  to be running.
- A compromised application cannot restore over its own data, because it holds neither the schema credentials nor
  anything that reads a backup.
- Files kept with an external storage provider are not backed up by Astrana, because the provider manages them.
- Sessions are not backed up, because restoring them would bring back sign-ins the owner may have ended on purpose.
- Anything that can be fetched or worked out again is left out, and anything the owner made or set, which would be hard
  to recreate, is kept.
- Archives are kept on a schedule the owner can change, by default seven daily, four weekly and twelve monthly, so a
  backup can hold content for up to a year after it was deleted.
- Scheduled backups are off until the owner turns them on, so an owner who never does has only the backups they made by
  hand, and possibly none.
- A backup is useless without its key, so an owner who loses the backup key loses every backup made under it.
- Letting the instance restore itself was rejected, because it would need the instance to hold schema rights and a key
  that reads every backup.
