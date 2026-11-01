# 71. The owner chooses PostgreSQL, MySQL or Microsoft SQL Server, and MariaDB follows the first release

Proposed.

## Context

The database is part of what an owner provides and looks after
([record 35](0035-every-instance-is-managed-by-its-owner-and-nobody-else-operates-it.md)). Someone already running one
database for something else should not have to run a second one to use Astrana. Shared hosting offers MySQL, MariaDB or
SQL Server, and the engine a shared hosting provider calls MySQL is often MariaDB. Every supported database adds
configuration, schema migrations and tests to maintain, so the set has to stay small.

## Decision

An instance runs on a relational database the owner supplies, PostgreSQL, MySQL or Microsoft SQL Server (MSSQL).
PostgreSQL and MySQL are recommended, because they are open source. MariaDB is supported too, starting after the first
release.

## Consequences

- Supporting several is affordable because search only ever covers one owner's own data, so Astrana never needs the
  large-scale search where the databases differ most.
- Supporting several is possible because all data access goes through Entity Framework Core
  ([record 41](0041-all-data-access-goes-through-entity-framework-core.md)). MariaDB is reached through the same
  provider as MySQL, and passes the same tests with identical schema migration scripts.
- MSSQL is allowed although it is not open source, because the database is something the owner provides, like the
  operating system ([record 39](0039-only-open-source-components-are-bundled.md)).
- Features are limited to those every supported database offers, unless an alternative is written for each.
- Every change has to be tested against every supported database, which makes builds slower. SQL Server's official
  container images run only on 64-bit x86 processors, so its tests need such a machine.
- Until MariaDB is supported, an instance cannot run on hosting that offers only MariaDB, which is most control-panel
  shared hosting. The common control panel installs MariaDB by default and cannot switch back to MySQL. In the first
  release, shared hosting support reaches a minority of the shared hosting that exists.
- What MariaDB needs beyond MySQL, such as a collation of its own and stricter handling of its certificates, is decided
  with its support.
- Desktop and laptop owners need a database server, which most do not have. Supporting an embedded database as well
  would need a record of its own.
- Leaving MariaDB unsupported was rejected because most shared hosting runs it.
