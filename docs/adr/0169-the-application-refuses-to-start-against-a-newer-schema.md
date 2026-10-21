# 169. The application refuses to start against a newer schema

Proposed.

## Context

Schema migrations only move forwards ([record 168](0168-schema-migrations-run-under-credentials-of-their-own.md)). An
older version of the application can still meet a database whose schema a newer version has changed, such as when an
owner reinstalls an earlier release after an update. An application reading a schema it does not know may misread or
damage the data.

## Decision

The application refuses to start against a database schema newer than the newest schema migration it knows, and tells
the owner which version the database needs.

## Consequences

- The running software never has to interpret data it does not understand, as with restoring a backup
  ([record 134](0134-a-backup-restores-into-the-same-or-a-newer-version-never-an-older-one.md)).
- Going back to an earlier release after an update means restoring the data from before it as well.
- Starting anyway and hoping the older version copes was rejected, because the damage it could do would be silent.
