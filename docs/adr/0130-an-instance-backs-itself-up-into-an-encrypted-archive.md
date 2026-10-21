# 130. An instance backs itself up into an encrypted archive

Proposed.

## Context

An owner's data lives on one instance, and hardware fails. The backup key is separate from the instance's other keys
([record 122](0122-the-identity-database-and-backup-keys-are-independent.md)).

## Decision

An instance backs up its configuration, its database and the files it manages into an encrypted archive, under a key
separate from the instance's own, and can restore from it. A backup can always be made by hand, and automatic backups
are something the owner turns on.

## Consequences

- Files kept with an external storage provider are not backed up by Astrana, because the provider manages them.
- Sessions are not backed up, because restoring them would bring back sign-ins the owner may have ended on purpose.
- Anything that can be fetched or worked out again is left out, and anything the owner made or set, which would be hard
  to recreate, is kept.
