# 108. The database is encrypted at rest

Proposed.

## Context

The database holds what an owner has written and what their instance knows about their peers
([record 71](0071-the-owner-chooses-postgresql-mysql-or-microsoft-sql-server.md)). On modern storage, deleting data does
not reliably destroy it.

## Decision

The database is encrypted at rest, as a requirement rather than a recommendation.

## Consequences

- Where Astrana holds the key, destroying the key destroys the content, which deleting files cannot promise.
- How it is done is not settled, because the three databases differ. PostgreSQL has no built-in encryption of its own,
  and encrypting content before it reaches the database would stop search from reading it.
- Media is not in the database, so files on the instance's own disk and in external storage are not covered by it.
