# 134. A jurisdiction selects a small set of values, not special behaviour

Proposed.

## Context

Where an owner lives ([record 49](0049-the-owner-declares-where-they-live.md)) affects a few thresholds, and rules that
may change live in data ([record 74](0074-rules-that-may-vary-live-in-data-and-fixed-rules-live-in-code.md)). Countries,
laws and customs change, and differ within countries, and Astrana has no reliable way to track all of them or to
guarantee that what it holds is accurate and current.

## Decision

A jurisdiction selects a profile, a small file of values such as the age of majority and the age of digital consent. It
changes nothing that is not in its profile. A profile may be national, sub-national or custom. One profile applies at a
time and states every value itself, and profiles are never layered. Astrana publishes signed baseline profiles for the
member and observer states of the United Nations, which travel with the catalogue of versions
([record 73](0073-information-about-versions-comes-from-one-central-signed-catalogue.md)). An owner may import a signed
profile published by a government or anyone else, or define a custom one. On a child's instance only a guardian may
change the jurisdiction or import a profile, and the child is shown the change.

## Consequences

- Baselines travel with the catalogue because they need one authoritative statement that cannot be made in a
  decentralised way, so the catalogue stays the one exception to decentralisation.
- Every value in a baseline carries its legal source and the date it was read, so anyone can see what Astrana concluded
  and on what authority. A baseline that has not been researched is marked as such and uses the universal jurisdiction's
  values. Imported and custom profiles may omit sources, so an owner can tell which values the project stands behind.
- Following the United Nations list leaves the question of what counts as a country to an outside, citable authority, so
  Astrana does not judge contested statehood. Nobody is excluded, because anywhere else can use an imported or custom
  profile, and the interface says so. The list is plain, alphabetical and searchable, with no flags and no maps.
- An imported profile is a file from a stranger. It accepts only a limited set of fields, is validated strictly and must
  be signed, and Astrana shows its signing key's fingerprint and its hash so the owner can compare them with a public
  page from its publisher. That check is the owner's to make, and Astrana does not claim to have made it.
- A baseline can be corrected when a law changes, without a new release, so a profile can change how an instance behaves
  without an update its owner chose.
- The project takes on interpreting the law of each place it writes a baseline for, and can get it wrong.
- Layering profiles, such as a region over its country, was rejected, because a reader would have to work out which of
  two rules wins.
