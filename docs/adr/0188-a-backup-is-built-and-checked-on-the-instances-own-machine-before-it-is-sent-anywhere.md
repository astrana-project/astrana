# 188. A backup is built and checked on the instance's own machine before it is sent anywhere

Proposed.

## Context

A backup may be kept elsewhere
([record 181](0181-the-instance-makes-scheduled-backups-and-astrana-owner-tools-makes-manual-ones-verifies-and-restores.md)),
and a transfer that fails part way leaves something that looks like a backup and is not.

## Decision

A backup is always created on the instance's own machine and checked to be complete before it is sent to where it will
be kept. It is never written directly to a remote destination. Free space is checked before building starts, and the
archive stays on the machine until the destination confirms it has received it.

## Consequences

- A half-written archive is never mistaken for a backup.
- An interrupted upload resumes from where it stopped, rather than starting again or leaving a partial archive.
- Scheduled backups run at quiet times through the scheduler
  ([record 28](0028-all-scheduled-work-runs-through-one-scheduler.md)), slowing or pausing while the instance is busy,
  and the owner may limit the bandwidth an upload uses.
- The instance's own machine needs free space for a whole archive, which a small shared hosting quota may not have, and
  where there is not room for one a backup cannot be made.
