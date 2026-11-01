# 190. A restore is started only by the owner, and only as a last resort

Proposed.

## Context

A restore replaces what an instance holds with an older copy and loses what came after it
([record 181](0181-the-instance-makes-scheduled-backups-and-astrana-owner-tools-makes-manual-ones-verifies-and-restores.md)).
If restoring single items were offered, backups would become the everyday answer to mistakes.

## Decision

A restore is never started automatically. The owner starts it, for a lost or failed machine, serious corruption,
ransomware or a compromise, or to undo a serious mistake. Single items are not restored from backups. Moving to new
hardware or other hosting is a migration and not a restore
([record 189](0189-moving-an-instance-is-a-move-not-a-copy.md)). Everyday mistakes are answered by changing a setting
back, with the audit log to say what it was, by the recovery built into updates, and by Astrana Owner Tools repairing
damaged files or records from the instance and its signed manifest rather than from backups.

## Consequences

- No fault, schedule or peer can set off a restore, so a restore always happens with the owner knowing.
- Repair works whether or not the owner has backups, and needs no recovery secret.
- Bringing back a single deleted item belongs to a recycle bin, designed apart from backups.
- Restoring single items from backups was rejected, so that a restore stays a last resort and always returns the whole
  instance to one moment.
