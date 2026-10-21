# 158. The inside defines ports and the outside adapts to them

Proposed.

## Context

The domain and use cases never name anything outside them ([record 155](0155-depend-in-the-direction-of-stability.md)),
but at runtime they still have to store data, reach peers, use keys and read the clock. The backend also has
interchangeable technologies on the outside, such as three database providers
([record 67](0067-the-owner-chooses-postgresql-mysql-or-microsoft-sql-server.md)), several hosting environments and each
operating system's own way of protecting keys
([record 122](0122-the-identity-database-and-backup-keys-are-independent.md)).

## Decision

The use cases define ports, which are interfaces stated in the domain's terms, and adapters on the outside implement or
call them. This is the ports and adapters pattern, also known as Hexagonal Architecture.

A port the outside calls is normally a use case, and a use case class can serve as its own port without a separate
interface. A port the use cases call, such as storage, the clock, key operations or reaching a peer, is always an
interface defined on the inside. A port is shaped by what the use cases need rather than by what a technology offers, so
it exposes no query objects from the persistence framework, Hypertext Transfer Protocol (HTTP) status codes or web
addresses. An adapter translates everything that crosses it, its data, its protocol and its failures. Adapters are
connected to ports only in the startup code.

## Consequences

- Technologies are added or replaced by writing adapters, and the domain and use cases do not change.
- The use cases can be tested with fakes and nothing else, including several simulated instances in one test.
- Differences between platforms, such as where data and keys are kept, become ports with one adapter for each platform.
- The clock port gives times in Coordinated Universal Time (UTC) ([record 3](0003-times-are-recorded-in-utc.md)).
- Every port the use cases call is an interface and a translation to maintain.
- A failure on the outside, such as a database timeout or an unreachable peer, reaches the use cases as a failure they
  understand.
- A generic repository over the persistence framework was rejected as a port, because it is shaped like the technology
  and lets query logic leak outwards.
