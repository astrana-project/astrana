# 56. After a gap, the scheduler does what still needs doing, not everything it missed

Proposed.

## Context

An instance may be switched off or asleep, and miss scheduled runs
([record 26](0026-all-scheduled-work-runs-through-one-scheduler.md)).

## Decision

When the scheduler resumes after time away, it works out what still needs doing, rather than replaying what it missed.
Thirty missed backups run as one, notifications past their usefulness are dropped, and expiry always runs, because
overdue content stays overdue.

## Consequences

- A machine that was off for a month does not wake to a flood of work.
