# 30. Internal and external boundaries are treated differently

Proposed.

## Context

Data crosses two kinds of boundary in the backend. Some boundaries lie inside one instance, such as between the domain
and a use case, and both sides are released together and checked by the compiler. Others separate the instance from
everything outside it, such as browsers, peers, the database, the operating system and other components, where the other
side runs separately and may be a different version. Treating both kinds alike either adds needless ceremony inside the
instance or leaves its edge underprotected. Every input that crosses the edge has to be validated and sanitised
([record 11](0011-all-input-is-validated-and-sanitised.md)).

## Decision

Only types shaped by an external contract cross an external boundary. Types carrying data in are named with the suffix
`Inbound`, and types carrying data out with the suffix `Outbound`. Each adapter owns the inbound and outbound types of
its own boundary, maps them to and from the inside's types, and validates everything inbound. No domain type crosses an
external boundary. The database is the one exception, because the instance owns its schema and changes it in the same
release as its code. There the persistence adapter maps aggregates directly, through configuration held outside the
domain.

Inside the instance, types cross internal boundaries freely and change in the same commit as everything that uses them.
The domain's own record of an aggregate's state at a point in time is called a snapshot, and it crosses internal
boundaries only.

Boundaries between bounded contexts are internal, but they are treated as nearly external, so that one context never
uses another's aggregates or snapshots directly.

## Consequences

- Code inside the instance can change quickly, because internal boundaries need no versioning or defensive mapping.
- Each external contract can change on its own schedule without changes to the domain.
- Internal fields cannot reach a browser or a peer by accident.
- There is mapping code at every external boundary, which is repetitive but simple to test.
- Treating every boundary as external was rejected because of the ceremony it adds within one release. Treating every
  boundary as internal was rejected because it exposes domain types to parties on other versions and to hostile input.
