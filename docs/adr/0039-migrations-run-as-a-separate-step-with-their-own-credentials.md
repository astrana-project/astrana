# 39. Migrations run as a separate step, with their own credentials

Proposed.

## Context

Owners will not run database migrations by hand, so updates have to apply them automatically and safely. Changing a
schema needs database rights that the running backend should never hold, because a backend that can change its own
schema can do far more damage if it is compromised. Each supported database has its own migrations
([record 38](0038-support-postgresql-mysql-and-sql-server.md)).

## Decision

Migrations are applied before the backend starts serving, by a migration step that connects with credentials of its own,
which may change the schema. The running backend connects with credentials that can read and write data and nothing
else. Where an environment cannot run a separate step, as on shared hosting, the backend applies the migrations at
startup with the migration credentials and closes that connection before it serves any request. A backend refuses to
start against a schema newer than the newest migration it knows, and a backup is taken before any migration runs.

## Consequences

- Updates need nothing from the owner.
- A compromised backend cannot change or drop the schema.
- Installers and hosts have to set up two sets of database credentials.
- On shared hosting the migration credentials are stored where the backend can read them, and some hosts offer only one
  database user, so there the backend's protection against changing its own schema is weaker or absent.
- Undoing a failed update means restoring the backup taken before it, because migrations only move forwards.
- What a backup contains and how it is restored need records of their own.
- Migrating with the backend's own credentials was rejected because it would give the running backend the right to
  change the schema permanently. Migrations run by hand were rejected because owners cannot be expected to run them.
