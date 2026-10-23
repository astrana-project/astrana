# 28. All scheduled work runs through one scheduler

Proposed.

## Context

Expiry, backups, notifications and checks all run on a schedule. If each ran on a timer of its own, work that was
overdue or had failed would be hard to see, because there would be no one place to look.

## Decision

Every scheduled task is defined and run in a single scheduler, not in several separate mechanisms.

## Consequences

- There is one place to answer whether anything is overdue.
- Each run is reported as ran, declined or failed.
- If the scheduler stops, every scheduled task stops with it.
