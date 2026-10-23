# 92. Jurisdiction never leaves the instance

Proposed.

## Context

An instance knows where its owner lives ([record 47](0047-the-owner-declares-where-they-live.md)).

## Decision

The declared jurisdiction is never sent to peers, to the project, or in telemetry.

## Consequences

- A peer has no business knowing where an owner lives, and is never told.
- A peer cannot adapt what it does to obligations that apply in the owner's country.
- The project learns nothing about where its users are, so it cannot tell which jurisdictions matter most to them.
