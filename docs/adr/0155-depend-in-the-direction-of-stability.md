# 155. Depend in the direction of stability

Proposed.

## Context

The parts of the backend change at different rates and for different reasons. Business rules change when the domain is
better understood. Technical details change when a database provider is added, the runtime is upgraded or the peer
protocol gains a capability. Instances that run older or newer versions, controlled by other owners, depend on the peer
protocol. When code that rarely changes depends on code that often changes, every technical change risks reaching the
business rules, and changes become slower, riskier and harder to review.

## Decision

Source code dependencies point towards the parts of the backend that are more stable, meaning harder to change because
more depends on them and less likely to need to change. The most stable part is the domain, then the use cases and the
ports they define, then the adapters, such as endpoints, persistence and peer clients, and finally the startup code that
wires them together, which depends on everything and is depended on by nothing. Code never depends on anything further
along that order than itself, and the domain and use cases never name anything outside them.

The most stable parts consist mainly of abstractions, such as domain concepts and ports, so that they can be extended
without being modified.

A contract that other instances or other components depend on is treated as highly stable wherever its code sits. The
peer protocol is implemented in adapters, but it changes only by adding capabilities that peers can test for
([record 120](0120-peers-check-what-each-other-can-do-not-which-version-they-run.md)), and it is never built from
internal types, the domain's included.

## Consequences

- Technology can be added or replaced by writing new adapters, without changing the domain.
- The domain and use cases can be tested in isolation, with fakes standing in for everything outside them.
- The rule is simple to state, so it can be checked automatically.
- Contracts used beyond the instance are protected explicitly rather than by convention.
- The use cases have to define ports for what they need, which adds interfaces and mapping code.
- Contributors need to understand dependency inversion to work within the rule.
- Stability sometimes has to be judged rather than read from the folder structure, as the peer protocol shows.
- Deciding dependencies case by case was rejected because the domain gradually takes on framework and persistence
  concerns. A layered architecture in which each layer depends on the one below was rejected because the domain ends up
  depending on persistence, the opposite of the direction wanted.
