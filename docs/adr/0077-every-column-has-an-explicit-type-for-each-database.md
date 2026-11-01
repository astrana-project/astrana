# 77. Every column has an explicit type for each database

Proposed.

## Context

Entity Framework Core is configured through its Fluent application programming interface (API)
([record 44](0044-entity-framework-core-is-configured-only-through-its-fluent-api.md)), and configuration that differs
between databases is kept in one set for each
([record 76](0076-each-database-has-its-own-schema-migrations-kept-as-reviewed-sql-in-a-project-of-its-own.md)). Left to
itself, each database provider picks its own type for a value, and the providers do not agree. A backup restores values
into a schema the application builds for itself, and restoring into a different database works only where the types
agree.

## Decision

The database type of every column, or the default type for each runtime type, is stated explicitly for each supported
database, rather than left to the provider's choice.

## Consequences

- The databases hold the same values in the same way as far as their engines allow, so moving an instance from one
  database to another can be relied on rather than hoped for.
- A change in a provider's defaults cannot silently change the schema.
- Every new runtime type, and every column that differs from the default, needs a type chosen for each database.
- Leaving types to each provider was rejected because the same model would then be stored differently on each database.
