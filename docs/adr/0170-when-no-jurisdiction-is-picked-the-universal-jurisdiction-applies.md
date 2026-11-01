# 170. When no jurisdiction is picked, the universal jurisdiction applies

Proposed.

## Context

Some owners will have good reason not to say where they live, a declaration cannot be checked, and some places have no
researched profile of their own
([record 134](0134-a-jurisdiction-selects-a-small-set-of-values-not-special-behaviour.md)).

## Decision

There is a universal jurisdiction, and it is the default. It applies whenever no jurisdiction is picked, and it is also
the fallback for a place without a researched profile. Its values are set to the protective side, with Coming of Age at
18 and the age of digital consent at 16.

## Consequences

- Nobody has to reveal where they live to use Astrana.
- A place whose profile has not been researched gets protective values rather than guessed ones.
- A declaration cannot be checked, so someone who falsely claims a more permissive place gets that place's values. The
  universal jurisdiction protects those who pick none, and does not prevent a false claim.
- Eighteen is the most common age of majority. Places that set it higher are protected only when their owners pick them.
- Refusing to set up an instance until a jurisdiction is picked was rejected, because it would force a disclosure the
  owner may have good reason to withhold.
