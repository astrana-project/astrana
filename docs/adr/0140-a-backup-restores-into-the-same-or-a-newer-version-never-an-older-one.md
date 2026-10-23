# 140. A backup restores into the same or a newer version, never an older one

Proposed.

## Context

Backups outlive the version that made them
([record 136](0136-an-instance-backs-itself-up-into-an-encrypted-archive.md)).

## Decision

A backup made on an older version can be restored into a newer one, and is upgraded on the way in. Restoring into an
older version is refused. The owner is told which version a backup came from before restoring.

## Consequences

- The running software never has to interpret data it does not understand.
- Every newer version has to keep the way to upgrade a backup made by any older version.
- An owner who goes back to an older version cannot restore a backup made by a newer one.
- Refusing any difference in version was rejected, because every update would leave the owner's earlier backups
  unusable.
