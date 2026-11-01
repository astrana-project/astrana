# 200. Audit entries are carried across a restore, and any gap is recorded

Proposed.

## Context

A restore usually follows an incident, so the audit entries from the period being restored over
([record 9](0009-every-material-action-is-logged-and-the-log-never-copies-content.md)) are the record of what happened.
They also carry the accountability of guardians, custodians and reports. An archive holds only the entries up to the
moment it was made.

## Decision

Audit entries newer than the archive are carried forward from the old database where it still exists, and marked as
carried over. Their integrity is checked, and an entry that fails is kept and flagged, not acted on. Where the old
database is gone, an explicit gap is recorded. The restore itself is always logged, and audit retention is applied again
afterwards ([record 46](0046-the-audit-log-is-pruned-not-kept-forever.md)).

## Consequences

- A restore cannot be used to cover tracks.
- A missing period shows as a gap rather than passing silently.
- A flagged entry is kept because discarding it could lose evidence, and is not acted on because it may have been
  tampered with.
