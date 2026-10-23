# 68. The owner chooses PostgreSQL, MySQL or Microsoft SQL Server

Proposed.

## Context

The database is part of what an owner provides and looks after
([record 32](0032-every-instance-is-managed-by-its-owner-and-nobody-else-operates-it.md)). Someone already running one
database for something else should not have to run a second one to use Astrana, and shared hosting usually offers MySQL
or SQL Server and nothing else. Every supported database adds configuration, schema migrations and tests to maintain, so
the set has to stay small.

## Decision

An instance runs on a relational database the owner supplies, PostgreSQL, MySQL or Microsoft SQL Server (MSSQL).
PostgreSQL and MySQL are recommended, because they are open source.

## Consequences

- Supporting three is affordable because search only ever covers one owner's own data, so Astrana never needs the
  large-scale search where the databases differ most.
- Supporting three is possible because all data access goes through Entity Framework Core
  ([record 38](0038-all-data-access-goes-through-entity-framework-core.md)).
- MSSQL is allowed although it is not open source, because the database is something the owner provides, like the
  operating system ([record 36](0036-only-open-source-components-are-bundled.md)).
- Features are limited to those all three support, unless an alternative is written for each.
- Every change has to be tested against all three, which makes builds slower. SQL Server's official container images run
  only on 64-bit x86 processors, so its tests need such a machine.
- Desktop and laptop owners need a database server, which most do not have. Supporting an embedded database as well
  would need a record superseding this one.
