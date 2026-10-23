# 108. The database is encrypted at rest

Proposed.

## Context

The database holds what an owner has written and what their instance knows about their peers
([record 71](0071-the-owner-chooses-postgresql-mysql-or-microsoft-sql-server.md)). On modern storage, deleting data does
not reliably destroy it.

## Decision

The database is encrypted at rest.

## Consequences

- Which mechanism does the encrypting needs a record of its own, because the three databases differ. PostgreSQL has no
  built-in encryption of its own, and encrypting content before it reaches the database stops the database's own search
  from reading it.
- Where Astrana holds the key, destroying the key destroys the content, which deleting files cannot promise. Whether
  Astrana holds that key depends on the mechanism chosen.
- An instance never presents its database as encrypted when it cannot verify that it is, and tells its owner.
- Media is not in the database, so files on the instance's own disk and in external storage are not covered by it.
