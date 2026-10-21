# 104. An update is never applied without the owner

Proposed.

## Context

The catalogue of versions tells an instance when an update exists
([record 63](0063-information-about-versions-comes-from-one-central-signed-catalogue.md)).

## Decision

An update is never applied silently. The owner decides when to take it, even when it is mandatory.

## Consequences

- An owner is never surprised by a change to their own instance.
- A mandatory update states why it is mandatory, and comes with a grace period and notice that grows more urgent.
