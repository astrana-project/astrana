# 244. Only Astrana Owner Tools can change the database schema, and only when the owner applies it

Proposed.

## Context

Owners will not change a database schema by hand, so updates have to apply schema migrations safely, once the owner has
chosen to update ([record 129](0129-an-update-is-never-applied-without-the-owner.md)). Changing a schema needs database
rights that the running application should never hold. An application that can change its own schema can, if
compromised, plant triggers or procedures that survive the fix, or lift protections enforced in the database. Each
supported database has its own reviewed schema migration scripts
([record 76](0076-each-database-has-its-own-schema-migrations-kept-as-reviewed-sql-in-a-project-of-its-own.md)), and
Astrana Owner Tools does the work that needs the host machine's privileges
([record 85](0085-astrana-owner-tools-does-what-needs-the-host-machine-and-the-applications-setup-does-the-rest.md)).

## Decision

An instance uses three database accounts. The content account, which the application connects with, can read and write
data and has no rights over the schema. The schema account owns the tables and is used only by Astrana Owner Tools, to
install, update and restore an instance. The database's administrator account is used only to create the other two.

Schema migrations only move forwards, and run only when Astrana Owner Tools applies them as a deliberate step, never
when the application starts. After an update the application stays in maintenance until its schema migrations have been
applied. On shared hosting the schema account's password is kept only on the owner's own computer.

## Consequences

- A compromised application cannot change or drop the schema, and no schema change happens by accident.
- A compromised hosting provider's machine cannot change the schema either, because on shared hosting the only account
  it holds reads and writes content. Updates on shared hosting already run from the owner's computer, so keeping the
  password there costs nothing extra.
- On the owner's own hardware both accounts are reachable from the same machine, so an attacker who controls the machine
  rather than only the application can act as either.
- A restore writes content as well as structure, and runs under the schema account, so restoring is work for Astrana
  Owner Tools and not for the running instance.
- The grants each database needs for the content account differ, and on some a grant made for the whole database would
  also let the content account read and write the staging tables a restore uses. The grants are stated for each database
  rather than in general.
- The owner chooses the database's name, and Astrana Owner Tools suggests names for the content and schema accounts from
  it, which the owner may change. The names are checked against the engine's rules and the hosting provider's prefix and
  length limits.
- A schema migration that fails is rolled back from the copy of the database taken before it ran.
- Running schema migrations under the application's own account was rejected because it gives the running application
  schema rights permanently. Applying schema migrations when the application starts was rejected because it would happen
  whenever the application restarted, outside the owner's control.
