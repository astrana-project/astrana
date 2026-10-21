# 160. Schema migrations run under credentials of their own

Proposed.

## Context

Owners will not change a database schema by hand, so updates have to apply schema migrations automatically and safely,
once the owner has chosen to update ([record 104](0104-an-update-is-never-applied-without-the-owner.md)). Changing a
schema needs database rights that the running application should never hold. An application that can change its own
schema can, if compromised, plant triggers or procedures that survive the fix, or lift protections enforced in the
database. Each supported database has its own schema migrations
([record 65](0065-the-owner-chooses-postgresql-mysql-or-microsoft-sql-server.md)), and the application's setup handles
the database and its credentials
([record 69](0069-the-installer-does-only-what-must-come-first-and-the-applications-setup-does-the-rest.md)).

## Decision

Schema migrations run under database credentials of their own, which may change the schema. The running application
connects with credentials that can read and write data and nothing else. The application's setup creates or asks for
both sets, and runs the first schema migrations with the migration credentials. On each update, schema migrations are
applied before the application starts serving. Where an environment cannot run that as a separate step, as on shared
hosting, the application applies them at startup with the migration credentials and closes that connection before it
serves any request. An application refuses to start against a schema newer than the newest migration it knows.

## Consequences

- Applying an update the owner chose needs no manual step for the database.
- A compromised application cannot change or drop the schema.
- Both sets of credentials are kept on the same machine, so an attacker who controls the machine rather than only the
  application gets both.
- On shared hosting with a single database user the protection is absent, and the instance tells the owner so.
- A rollback snapshot is taken before schema migrations run
  ([record 126](0126-an-instance-backs-itself-up-into-an-encrypted-archive.md)), and a failure never leaves the database
  half changed ([record 129](0129-a-restore-either-completes-or-stops-never-half-done.md)).
- Schema migrations only move forwards, like restores
  ([record 130](0130-a-backup-restores-into-the-same-or-a-newer-version-never-an-older-one.md)).
- Running schema migrations under the application's own credentials was rejected because it gives the running
  application schema rights permanently. Asking the owner for privileged credentials at every update was rejected
  because many owners will not have them to hand, and an update failing part way is worse than a slower one.
