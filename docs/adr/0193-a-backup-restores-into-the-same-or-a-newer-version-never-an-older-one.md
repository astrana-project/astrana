# 193. A backup restores into the same or a newer version, never an older one

Proposed.

## Context

Backups outlive the version that made them
([record 181](0181-the-instance-makes-scheduled-backups-and-astrana-owner-tools-makes-manual-ones-verifies-and-restores.md)).

## Decision

A backup made on an older version can be restored into a newer one, and is upgraded on the way in. Restoring into an
older version is refused. The owner is told which version a backup came from before restoring.

## Consequences

- The running software never has to interpret data it does not understand.
- A backup is upgraded by building the structure of the version that made it with Astrana's own schema migrations,
  loading its data, and applying the remaining migrations, so it is upgraded the same way a live instance is.
- Every newer version has to keep every schema migration, since a backup made by any older version is upgraded through
  them.
- An owner who goes back to an older version cannot restore a backup made by a newer one.
- Refusing any difference in version was rejected, because every update would leave the owner's earlier backups
  unusable.
