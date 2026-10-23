# 41. All data access goes through Entity Framework Core

Proposed.

## Context

A database outlasts any one release of Astrana, and the company or community behind it can stop maintaining it or change
its licence. Owners also trust different databases, and some are free while others are paid. Writing Astrana for one
database would tie every instance to that one provider's future.

## Decision

All data access goes through Entity Framework Core, an object-relational mapper that translates between the application
and the database. Astrana never depends on one database provider.

## Consequences

- Astrana can support the databases owners trust most, whether free or paid.
- If a provider stops maintaining its database or changes its licensing, moving away from it is far easier than it would
  otherwise be.
- One translation layer keeps several databases supported without each dialect kept up by hand. Each supported database
  still needs testing, because providers differ.
- Astrana uses only what every supported provider can do, so a feature one database offers and the others lack goes
  unused.
- Entity Framework Core is itself an outside component, and is kept because it is mature and well maintained
  ([record 4](0004-astrana-depends-on-outside-components-only-where-it-must.md)).
- Writing for a single database was rejected because it ties every instance to that provider. Hand-writing queries for
  each database was rejected because the extra dialects drift and break.
