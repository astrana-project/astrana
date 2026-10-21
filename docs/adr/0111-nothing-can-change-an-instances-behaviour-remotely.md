# 111. Nothing can change an instance's behaviour remotely

Proposed.

## Context

Feature flags let software turn behaviour on and off. A flag the project could switch from afar would change how an
instance behaves without an update
([record 66](0066-information-about-versions-comes-from-one-central-signed-catalogue.md)).

## Decision

No feature can be switched remotely. A feature flag's default is the same everywhere, nothing assigns an instance to a
variant, and the project runs no experiments across instances.

## Consequences

- An instance behaves differently only when its owner changes something or takes an update.
- A feature is judged by argument, not by measuring how people respond, which is slower.
