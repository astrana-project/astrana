# 194. A restore reads only values, and takes structure from Astrana's own migrations

Proposed.

## Context

An archive is written long before it is restored, and may be altered in between. A restore that took tables, columns or
commands from an archive would act on instructions nothing can check, and a backup could reshape a database or run
something in it. Structure belongs to each database's own schema migrations
([record 76](0076-each-database-has-its-own-schema-migrations-kept-as-reviewed-sql-in-a-project-of-its-own.md)), and a
backup restores into the same or a newer version
([record 193](0193-a-backup-restores-into-the-same-or-a-newer-version-never-an-older-one.md)).

## Decision

A restore reads only values from an archive, each in a fixed form set by Astrana's rules for each type. The tables they
go into are built by Astrana's own signed schema migrations up to the archive's schema version, and the remaining
migrations are applied after loading. Data is loaded with constraints enforced, in dependency order, keeping its
identifiers, with sequences reset. Row counts, hashes, the checks that detect tampering and the media are all verified
before the restore can complete.

## Consequences

- A backup cannot reshape a database or carry commands into it, so a restore cannot be used to run something.
- Values in fixed forms, with structure built by the target's own migrations, let an archive made on one supported
  database engine restore into another.
- Every type needs one fixed form, written down in the archive format, that every engine can read back.
- Whether a restore uses each engine's own bulk loading is open, and so is how fast a restore can be on some engines.
- Archiving each engine's own dump, structure included, was rejected, because a restore would then run whatever the dump
  held.
