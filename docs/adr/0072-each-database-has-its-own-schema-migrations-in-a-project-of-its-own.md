# 72. Each database has its own schema migrations, kept as reviewed SQL in a project of its own

Proposed.

## Context

An instance runs on one of several relational databases
([record 71](0071-the-owner-chooses-postgresql-mysql-or-microsoft-sql-server.md)). Entity Framework Core generates
schema migrations for one database provider at a time, and some configuration, such as column types, collations and
concurrency tokens, differs between them. The engines do not follow the Structured Query Language (SQL) standard
exactly, and a schema change that is produced at run time cannot be read or audited before it reaches an owner's data.

## Decision

Configuration that differs between the databases is kept together, one set for each database. Each database has its own
schema migrations, in a project of its own, such as `Astrana.Persistence.PostgreSql`, `Astrana.Persistence.MySql` and
`Astrana.Persistence.SqlServer`. Each references the project holding the data model, and the backend loads the one for
the database in use by name, so that no project references another in a circle. Each schema migration is generated as an
SQL script for each database, committed to source control and packaged with the release, and that script is what is
applied to an instance.

## Consequences

- Each database's schema migrations are generated, reviewed and tested on their own, because they differ.
- Every change to the schema can be read and audited in source control before any instance runs it.
- A change to the data model needs a schema migration script for every database in the same change.
- Supporting a further database means adding a project, not changing the others.
- One set of schema migrations for all databases was rejected because Entity Framework Core cannot generate one that
  suits every provider. Generating schema changes at run time was rejected because nobody could review what an instance
  would run.
