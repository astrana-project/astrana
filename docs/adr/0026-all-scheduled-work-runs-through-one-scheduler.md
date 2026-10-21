# 26. All scheduled work runs through one scheduler

Proposed.

## Context

Expiry, backups, notifications and checks all run on a schedule.

## Decision

Every scheduled task is defined and run in a single scheduler, not in several separate mechanisms.

## Consequences

- There is one place to answer whether anything is overdue.
- Each run is reported as ran, declined or failed.
