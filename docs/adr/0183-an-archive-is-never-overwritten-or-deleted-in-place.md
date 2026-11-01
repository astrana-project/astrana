# 183. An archive is never overwritten or deleted in place

Proposed.

## Context

A backup that an intruder on the instance can overwrite or delete is not a backup, and destroying backups first is how
ransomware makes its demand stick. The instance writes archives and media copies to destinations of the owner's choosing
([record 181](0181-the-instance-makes-scheduled-backups-and-astrana-owner-tools-makes-manual-ones-verifies-and-restores.md)).

## Decision

Archives and media copies are written as new objects and are never overwritten or deleted in place, with write-only
access or retention locks wherever the destination supports them. An archive that has aged out is removed by Astrana
Owner Tools with the owner's own credentials for the destination, or by the destination's own expiry rules. Each
destination is checked periodically, and the owner is told what it can actually protect against.

## Consequences

- Where the destination enforces it, someone who takes over the instance cannot destroy the backups already made.
- Many destinations cannot offer a retention lock, and the owner is told plainly which kind they have rather than being
  left to assume.
- The instance's own access to a destination needs only the right to write, so removing aged-out archives needs the
  owner's credentials or rules set at the destination.
- Space at a destination stays in use until aged-out archives are removed.
