# 79. Deleting a record removes it, and there are no history tables

Proposed.

## Context

Content expires by default ([record 6](0006-content-expires-by-default.md)), and an owner may remove anything stored on
their instance
([record 45](0045-the-owner-of-an-instance-may-remove-anything-stored-on-it-except-a-report-about-their-content.md)).
General application practice recommends hiding deleted records behind a flag and copying changed ones into history
tables, and both keep data that was meant to be gone.

## Decision

Records are never hidden with a deleted flag, and never copied into history tables. Deleting a record removes it. The
one exception is the versioning of text
([record 7](0007-an-edit-makes-a-new-version-and-earlier-versions-stay-visible.md)).

## Consequences

- What expires or is deleted is gone from the database, so expiry and deletion mean what they say.
- Queries need no filter for deleted rows, so no query can forget one and show something that was deleted.
- Soft delete and history tables were rejected because they keep the data that expiry and deletion exist to remove.
