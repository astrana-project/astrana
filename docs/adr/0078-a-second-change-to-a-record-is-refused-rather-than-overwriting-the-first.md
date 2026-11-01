# 78. A second change to a record is refused rather than overwriting the first

Proposed.

## Context

More than one person can change the same thing on an instance, such as an owner on two devices, or two guardians of the
same child. If each change replaced what was stored, the later one would silently overwrite the earlier, and nobody
would know.

## Decision

Changes to records use optimistic concurrency. A change carries the version of the record it was made from, and if the
record has changed since, the change is refused and the person making it is told, so they can see the newer version and
decide again.

## Consequences

- No change is lost without someone knowing.
- Every record that can be changed carries a concurrency token, configured for each database
  ([record 76](0076-each-database-has-its-own-schema-migrations-kept-as-reviewed-sql-in-a-project-of-its-own.md)).
- A person whose change is refused has to make it again against the newer version.
- Letting the last change win was rejected because it silently discards the first.
