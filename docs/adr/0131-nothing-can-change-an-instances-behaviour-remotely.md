# 131. Nothing can change an instance's behaviour remotely

Proposed.

## Context

Feature flags let software turn behaviour on and off. A flag the project could switch from afar would change how an
instance behaves without an update
([record 73](0073-information-about-versions-comes-from-one-central-signed-catalogue.md)).

## Decision

No feature can be switched remotely. A feature flag's default is the same everywhere, nothing assigns an instance to a
variant, and the project runs no experiments across instances.

## Consequences

- An instance's code and features change only when its owner changes something or takes an update. Signed data, such as
  the rules for each country, can still change without a release
  ([record 74](0074-rules-that-may-vary-live-in-data-and-fixed-rules-live-in-code.md)).
- Which release channel an instance follows is the owner's choice, and pre-release channels are never assigned to it.
- An instance that limits itself after declining a mandatory update past its grace period
  ([record 129](0129-an-update-is-never-applied-without-the-owner.md)) does so by rules in the code it already runs. The
  catalogue only states that the update is mandatory and how long the grace period is.
- A feature is judged by argument, not by measuring how people respond, which is slower.
