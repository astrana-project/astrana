# 134. A backup restores into the same or a newer version, never an older one

Proposed.

## Context

Backups outlive the version that made them
([record 130](0130-an-instance-backs-itself-up-into-an-encrypted-archive.md)).

## Decision

A backup made on an older version can be restored into a newer one, and is upgraded on the way in. Restoring into an
older version is refused. The owner is told which version a backup came from before restoring.

## Consequences

- The running software never has to interpret data it does not understand.
