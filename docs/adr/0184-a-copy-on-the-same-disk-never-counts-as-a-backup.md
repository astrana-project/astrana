# 184. A copy on the same disk never counts as a backup

Proposed.

## Context

The only destination Astrana could pick without the owner is the disk the instance runs on, and a copy there survives
none of the failures a backup exists for. A quick local copy is still useful for undoing a recent problem
([record 181](0181-the-instance-makes-scheduled-backups-and-astrana-owner-tools-makes-manual-ones-verifies-and-restores.md)).

## Decision

A backup needs a destination off the instance's own disk, at least a separate drive and ideally a remote location that
is secure and that the owner trusts. One destination is required and a second is optional. A copy on the same disk is
allowed as an extra for quick recovery, keeping only the last few copies, and is never counted as a backup. Until an
off-device destination exists, the instance shows the lack of one as a standing health item, whatever local copies it
has.

## Consequences

- A local copy cannot pass for safety, because the health item stays until a real destination exists.
- A separate disk in the same machine is described as protecting against that one disk failing, and not against losing
  the machine.
- An owner with one disk and no remote location has no backup until they add a destination.
- Refusing local copies altogether was rejected, because they give the quickest recoveries, and the harm lies only in
  counting them as backups.
