# 60. After a gap, the scheduler does what still needs doing, not everything it missed

Proposed.

## Context

An instance may be switched off or asleep, and miss scheduled runs
([record 28](0028-all-scheduled-work-runs-through-one-scheduler.md)).

## Decision

When the scheduler resumes after time away, it works out what still needs doing, rather than replaying what it missed.
Thirty missed backups run as one, a notification is dropped once the time its kind stays useful has passed, and expiry
always runs, because overdue content stays overdue.

## Consequences

- A machine that was off for a month does not wake to a flood of work.
- Every scheduled task has to define its own rule for catching up, and every kind of notification how long it stays
  useful.
- A notification dropped this way never reaches the owner.
