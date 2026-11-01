# 113. An update is never applied without the owner

Proposed.

## Context

The catalogue of versions tells an instance when an update exists
([record 69](0069-information-about-versions-comes-from-one-central-signed-catalogue.md)).

## Decision

An update is never applied silently. The application tells the owner an update exists, and applying it is always the
owner's explicit action, even when it is mandatory.

## Consequences

- An owner is never surprised by a change to their own instance.
- An instance whose owner does not act stays unpatched, and its peers bear part of that risk.
- A mandatory update states why it is mandatory, and comes with a grace period and notice that grows more urgent. After
  the grace period, an instance whose owner has declined it takes on no new commitments and consumes no peer content.
  Everything else continues, and the owner's own data is never held back to make them update.
- The compatibility update that comes with a new major version has a grace period of six months. A mandatory security
  update's grace period is set for each issue and stated in the update itself, because every day of grace is a day of
  exposure.
- After a package manager updates the program, the instance stays in maintenance until the owner has its schema
  migrations applied, never at start-up.
- Blocking use of the instance until the owner approves a mandatory update was rejected, because it would make the
  owner's own instance the lever.
