# 36. All data access goes through Entity Framework Core

Proposed.

## Context

A database outlasts any one release of Astrana, and the company or community behind it can stop maintaining it or change
its licence. Owners also trust different databases, and some are free while others are paid. Writing Astrana for one
database would tie every instance to that one provider's future. How the mapping between the application and the
database is described also decides whether persistence concerns leak into the code that holds Astrana's rules.

## Decision

All data access goes through Entity Framework Core, an object-relational mapper that translates between the application
and the database. Astrana never depends on one database provider. Entity Framework Core is configured with its Fluent
application programming interface (API), in configuration classes kept apart from the domain, and never with attributes
on domain types. Domain objects keep their encapsulation, so Entity Framework Core maps their private and backing
fields, and value objects and identifiers are mapped with value converters, owned types or complex types rather than
public setters.

## Consequences

- Astrana can support the databases owners trust most, whether free or paid.
- If a provider stops maintaining its database or changes its licensing, moving away from it is far easier than it would
  otherwise be.
- Support for several databases is real rather than nominal. Without a translation layer, each dialect would be kept up
  by hand, and the extra ones would quietly break.
- The domain contains nothing about persistence, so it can change without regard to how it is stored.
- Entity Framework Core is itself an outside component, and is kept because it is mature and well maintained
  ([record 4](0004-astrana-depends-on-outside-components-only-where-it-must.md)).
- Writing for a single database was rejected because it ties every instance to that provider. Hand-writing queries for
  each database was rejected because the extra dialects drift and break. Attributes on domain types were rejected
  because they bring persistence concerns into the domain and can express less than the Fluent API.
