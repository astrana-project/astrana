# 170. The universal jurisdiction applies when an owner declines to say where they live or their place has no profile

Proposed.

## Context

Some owners will have good reason not to say where they live, a declaration cannot be checked, and some places have no
researched profile of their own
([record 134](0134-a-jurisdiction-selects-a-small-set-of-values-not-special-behaviour.md)).

## Decision

The question of where the owner lives is always asked and cannot be skipped, and declining to say is one of its answers.
There is a universal jurisdiction, which applies when the owner declines, and when no profile is available for the place
they name. Its values are set to the protective side, with Coming of Age at 18 and the age of digital consent at 16.

## Consequences

- Nobody has to reveal where they live to use Astrana.
- A place whose profile has not been researched gets protective values rather than guessed ones, so declaring truthfully
  is never worse than declining.
- The fallback is the design working, not a gap, and it is the common case while few profiles exist.
- An owner who never saw the question would have ended up with the protective values without choosing them, which is why
  the question cannot be skipped.
- A declaration cannot be checked, so someone who falsely claims a more permissive place gets that place's values. The
  universal jurisdiction protects those who pick none, and does not prevent a false claim.
- Eighteen is the most common age of majority. Places that set it higher are protected only when their owners pick them.
- Refusing to set up an instance until a place is named was rejected, because it would force a disclosure the owner may
  have good reason to withhold.
