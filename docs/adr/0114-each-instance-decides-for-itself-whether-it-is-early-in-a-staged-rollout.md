# 114. Each instance decides for itself whether it is early in a staged rollout

Proposed.

## Context

Offering an update to a few instances first can catch a bad release before it reaches everyone
([record 69](0069-information-about-versions-comes-from-one-central-signed-catalogue.md)).

## Decision

A staged rollout works by each instance choosing for itself whether it is among the first to be offered an update. The
project does not watch or count who is in each group.

## Consequences

- A bad release reaches a fraction of instances before all of them.
- The project never learns which instances took part, so a rollout cannot become a way of observing them.
- With nothing observed, a bad release comes to light only when someone reports it, which is slower than watching the
  early group would be.
