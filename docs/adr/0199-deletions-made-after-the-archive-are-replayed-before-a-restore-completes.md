# 199. Deletions made after the archive are replayed before a restore completes

Proposed.

## Context

Restoring an older archive would bring back content that people deleted after it was made, undoing their choice, and
content whose lifetime has passed ([record 6](0006-content-expires-by-default.md)). The audit log records each deletion
([record 9](0009-every-material-action-is-logged-and-the-log-never-copies-content.md)) and is pruned over time
([record 46](0046-the-audit-log-is-pruned-not-kept-forever.md)).

## Decision

Before the swap, deletions recorded in the old database's audit log after the archive was made are applied again to the
staged data, using the application's own deletion logic, which Astrana Owner Tools shares. Expiry is replayed in the
same pass, so content whose lifetime has passed is never written back. Media for deleted or expired items is not
fetched. The checks that detect tampering are updated to match, and one summary audit entry records the pass. Where the
old database is gone, or its entry for a deletion has been pruned, the deleted content returns and the owner is told
before the restore runs ([record 198](0198-a-restore-shows-what-it-will-lose-before-the-owner-confirms.md)).

## Consequences

- A deletion stays a deletion across a restore wherever its record survives.
- Sharing the application's deletion logic makes knock-on effects match what would have happened, with no second copy of
  that logic to drift.
- Not fetching media for items about to be deleted saves the transfer.
- Writing expired content back and letting expiry remove it later was rejected, because it would be served again in
  between.
