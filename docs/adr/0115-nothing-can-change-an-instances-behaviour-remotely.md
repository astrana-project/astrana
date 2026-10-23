# 115. Nothing can change an instance's behaviour remotely

Proposed.

## Context

Feature flags let software turn behaviour on and off. A flag the project could switch from afar would change how an
instance behaves without an update
([record 69](0069-information-about-versions-comes-from-one-central-signed-catalogue.md)).

## Decision

No feature can be switched remotely. A feature flag's default is the same everywhere, nothing assigns an instance to a
variant, and the project runs no experiments across instances.

## Consequences

- An instance's code and features change only when its owner changes something or takes an update. Signed data, such as
  the rules for each country, can still change without a release
  ([record 70](0070-rules-that-may-vary-live-in-data-and-fixed-rules-live-in-code.md)).
- A feature is judged by argument, not by measuring how people respond, which is slower.
