# 130. An owner may decline to say where they live, and then gets a universal protective profile

Proposed.

## Context

Some owners will have good reason not to say where they live, and a declaration cannot be checked
([record 117](0117-a-jurisdiction-selects-a-small-set-of-values-not-special-behaviour.md)).

## Decision

An owner may decline to say where they live. A universal profile then applies, set to the protective side, with Coming
of Age at 18 and the age of digital consent at 16.

## Consequences

- Nobody has to reveal where they live to use Astrana.
- A declaration cannot be checked, so someone who falsely claims a more permissive place gets that place's values.
  Declining protects those who decline, and does not prevent a false claim.
- Eighteen is the most common age of majority. Places that set it higher are protected only when their owners declare
  where they live.
- Refusing to set up an instance without a declared jurisdiction was rejected, because it would force a disclosure the
  owner may have good reason to withhold.
