# 117. A jurisdiction selects a small set of values, not special behaviour

Proposed.

## Context

Where an owner lives ([record 47](0047-the-owner-declares-where-they-live.md)) affects a few thresholds, and rules that
may change live in data ([record 70](0070-rules-that-may-vary-live-in-data-and-fixed-rules-live-in-code.md)).

## Decision

A declared jurisdiction selects a profile, a small signed file of values such as the age of majority and the age of
digital consent. It changes nothing that is not in its profile. Profiles travel with the catalogue of versions
([record 69](0069-information-about-versions-comes-from-one-central-signed-catalogue.md)).

## Consequences

- Rules that vary by country travel with the catalogue because they are the same kind of problem, one authoritative
  statement that cannot be made in a decentralised way, so the catalogue stays the one exception to decentralisation.
- Anyone can read the profile for their own jurisdiction and see what Astrana concluded.
- A profile can be corrected when a law changes, without a new release, so a profile can change how an instance behaves
  without an update its owner chose.
- The project takes on interpreting the law of each place it writes a profile for, and can get it wrong.
