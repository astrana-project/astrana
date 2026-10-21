# 113. A jurisdiction selects a small set of values, not special behaviour

Proposed.

## Context

Where an owner lives ([record 44](0044-the-owner-declares-where-they-live.md)) affects a few thresholds, and rules that
may change live in data ([record 67](0067-rules-that-may-vary-live-in-data-and-fixed-rules-live-in-code.md)).

## Decision

A declared jurisdiction selects a profile, a small signed file of values such as the age of majority and the age of
digital consent. It changes nothing that is not in its profile. Profiles travel with the catalogue of versions
([record 66](0066-information-about-versions-comes-from-one-central-signed-catalogue.md)).

## Consequences

- Anyone can read the profile for their own jurisdiction and see what Astrana concluded.
- A profile can be corrected when a law changes, without a new release.
