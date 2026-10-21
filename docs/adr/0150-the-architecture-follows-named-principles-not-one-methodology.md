# 150. The architecture follows named principles, not one methodology

Proposed.

## Context

Astrana has to stay maintainable for many years by contributors who come and go, while the technology around it changes,
from database providers and hosting environments to frameworks and the peer protocol. Named architectures such as Clean
Architecture, Hexagonal Architecture and Onion Architecture address this, and each brings useful principles. Adopted
whole, each also brings ceremony that does not fit this application, such as a separate project per layer, an interface
for every class and a mapping between every pair of layers. Adopting one by name also invites arguments about whether
the code really follows it, which settle nothing.

## Decision

The backend's architecture is guided by a set of named principles, each stated in a record of its own, rather than by
one methodology. They are the dependency rule, the different treatment of internal and external boundaries, ports and
adapters, a domain modelled with domain-driven design, and organisation by feature. Alongside them, the domain uses no
framework, each operation the application offers is a named use case, the domain and use cases can be tested without
infrastructure, and an abstraction exists only where something on its other side varies or lies outside the instance.

When two principles pull in different directions, the dependency rule is never broken, and within it, code that changes
together lives together.

## Consequences

- Each principle can be explained, enforced and superseded on its own.
- Contributors who know Clean Architecture, Hexagonal Architecture or domain-driven design recognise each principle
  under its usual name.
- Abstractions are added only where they earn their place, in the same spirit as adding components only where they must
  be ([record 4](0004-astrana-depends-on-outside-components-only-where-it-must.md)).
- Some of the ceremony those methodologies prescribe is absent, such as presenters, a project for every layer and a
  mapping between every pair of layers, and contributors may need this explained once.
- Adopting Clean Architecture whole was rejected because of its ceremony and the arguments it invites. Having no stated
  principles was rejected because dependencies drift towards convenience and there is nothing to review against.
