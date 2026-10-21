# 155. Code is organised by feature, for locality of behaviour

Proposed.

## Context

Organising code by technical layer, with endpoints in one place, use cases in another and mappings in a third, means one
change touches many folders, and understanding one feature means reading across the whole codebase. Contributors to an
open-source project often arrive to change one thing, so the cost of finding and understanding the code for that one
thing matters. The dependency rule ([record 151](0151-depend-in-the-direction-of-stability.md)) constrains the direction
of dependencies, not where files live.

## Decision

Backend code is organised first by bounded context
([record 154](0154-the-domain-is-modelled-with-domain-driven-design.md)) and then by feature, so that code which changes
together lives together. Each feature has one folder holding its use case, its endpoints, and its inbound and outbound
types, which carry their own mapping to and from the use case's types. Namespaces follow folders. Within a feature
folder, the types that belong to adapters are named for their role, ending in `Endpoint`, `Endpoints`, `Inbound` or
`Outbound`, and every other type in the folder is inside code.

Code is moved somewhere shared only when several features need the same thing, and until then similar code in different
features is accepted.

## Consequences

- Adding or changing a feature normally touches one feature folder and, when a rule changes, the domain.
- A contributor can understand an endpoint by reading one folder.
- The compiler does not stop inside code in a feature folder from naming the web framework, because it shares a project
  with the endpoint. The naming of adapter types lets an automated check do so instead.
- Some duplication between features is accepted.
- Organising by layer was rejected for the reasons above.
