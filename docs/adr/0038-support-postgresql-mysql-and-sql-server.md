# 38. Support PostgreSQL, MySQL and SQL Server

Proposed.

## Context

Owners run instances on their own servers, on desktops and laptops, and on shared hosting, which usually offers MySQL or
SQL Server and nothing else. Every supported database adds configuration, migrations and tests to maintain, so the set
has to stay small. The domain must not reference any persistence framework
([record 34](0034-the-domain-is-a-project-of-its-own-in-the-backend.md)).

## Decision

The backend supports PostgreSQL, MySQL and SQL Server, through Entity Framework Core. Entity Framework Core is
configured with its Fluent API, in one configuration class for each aggregate in the server project, and never with
attributes on domain types. Aggregates keep their encapsulation, so Entity Framework Core maps their private and backing
fields, and value objects and identifiers are mapped with value converters, owned types or complex types rather than
public setters. Configuration that differs between databases, such as column types, collations and concurrency tokens,
is kept together in the server project, one file for each database, and applied according to the database in use.

Each database's migrations are in a project of their own, `Astrana.Persistence.PostgreSql`, `Astrana.Persistence.MySql`
and `Astrana.Persistence.SqlServer`. Each references the server project, and the server loads the one for the database
in use by name, so that no project references another in a circle.

## Consequences

- Owners on shared hosting can use the database their host provides, and owners with their own servers can use one they
  already run.
- Features are limited to those all three databases support, unless an alternative is written for each.
- Every change has to be tested against all three databases, which makes builds slower. SQL Server's official container
  images run only on 64-bit x86 processors, so its tests need such a machine.
- Desktop and laptop installations would need a database server, which most owners do not have, so whether to support an
  embedded database as well needs a record of its own before the first release.
- Attributes on domain types were rejected because they bring persistence concerns into the domain and can express less
  than the Fluent API. Supporting one database was rejected because it would rule out most shared hosting.
