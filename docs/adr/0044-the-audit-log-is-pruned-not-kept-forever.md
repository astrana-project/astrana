# 44. The audit log is pruned, not kept forever

Proposed.

## Context

A log of every material action grows without end
([record 9](0009-every-material-action-is-logged-and-the-log-never-copies-content.md)).

## Decision

The audit log is archived and pruned automatically. Each kind of entry has a priority the owner can set, so common and
less important entries go first, and entries such as content being created, changed or deleted are kept longest.

## Consequences

- The log stays a size an instance can carry.
- What is kept longest is what matters most to understanding what happened.
- Once an entry is pruned it is gone, even if it later turns out to be the evidence someone needs.
- Once a deletion's entry is pruned, a restore from a backup older than the deletion cannot apply it again, so the
  deleted content comes back and the owner is told before the restore runs.
- Backups keep deleted content until they age out, whatever the log still holds, and people are told so at the moment
  they delete something.
