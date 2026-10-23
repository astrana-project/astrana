# 72. Each database has its own schema migrations, in a project of its own

Proposed.

## Context

An instance runs on PostgreSQL, MySQL or Microsoft SQL Server
([record 71](0071-the-owner-chooses-postgresql-mysql-or-microsoft-sql-server.md)). Entity Framework Core generates
schema migrations for one database provider at a time, and some configuration, such as column types, collations and
concurrency tokens, differs between the three.

## Decision

Configuration that differs between the three databases is kept together, one set for each database. Each database has
its own schema migrations, in a project of its own, `Astrana.Persistence.PostgreSql`, `Astrana.Persistence.MySql` and
`Astrana.Persistence.SqlServer`. Each references the project holding the data model, and the backend loads the one for
the database in use by name, so that no project references another in a circle.

## Consequences

- Each database's schema migrations are generated, reviewed and tested on their own, because they differ.
- A change to the data model needs a schema migration for every database in the same change.
- Supporting a further database means adding a project, not changing the others.
- One set of schema migrations for all three was rejected because Entity Framework Core cannot generate one that suits
  every provider.
