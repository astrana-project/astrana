# 88. Jurisdiction never leaves the instance

Proposed.

## Context

An instance knows where its owner lives ([record 43](0043-the-owner-declares-where-they-live.md)).

## Decision

The declared jurisdiction is never sent to peers, to the project, or in telemetry.

## Consequences

- A peer has no business knowing where an owner lives, and is never told.
