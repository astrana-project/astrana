# 39. Entity Framework Core is configured only through its Fluent API

Proposed.

## Context

All data access goes through Entity Framework Core
([record 38](0038-all-data-access-goes-through-entity-framework-core.md)), which has to be told how domain objects map
to tables. That can be described with attributes on the domain's own types, or in configuration kept apart from them.
Attributes put knowledge of persistence inside the domain, and can express less than the alternative.

## Decision

Entity Framework Core is configured with its Fluent application programming interface (API), in configuration classes
kept apart from the domain, and never with attributes on domain types. Domain objects keep their encapsulation, so
Entity Framework Core maps their private and backing fields, and value objects and identifiers are mapped with value
converters, owned types or complex types rather than public setters.

## Consequences

- The domain contains nothing about persistence, so it can change without regard to how it is stored.
- How each aggregate is stored is described in one place, apart from the rules it enforces.
- Everything Entity Framework Core can map is available, because the Fluent API can express more than attributes.
- Attributes on domain types were rejected because they bring persistence concerns into the domain and can express less
  than the Fluent API. Public setters added for persistence were rejected because they let any code change an object
  without going through its rules.
