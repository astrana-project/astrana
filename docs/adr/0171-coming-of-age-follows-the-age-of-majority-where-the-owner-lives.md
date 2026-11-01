# 171. Coming of Age follows the age of majority where the owner lives

Proposed.

## Context

Coming of Age ends a guardian's authority
([record 96](0096-at-coming-of-age-a-guardians-authority-ends-completely-and-automatically.md)), and the age of majority
differs from country to country
([record 134](0134-a-jurisdiction-selects-a-small-set-of-values-not-special-behaviour.md)).

## Decision

Coming of Age is the age of majority in the owner's declared jurisdiction. Where none is declared, the universal profile
applies
([record 170](0170-the-universal-jurisdiction-applies-when-an-owner-declines-to-say-where-they-live-or-their-place-has-no-profile.md)).

## Consequences

- Some jurisdictions set the age of majority at 19 or 21, so an owner who declares nothing may reach Coming of Age
  earlier than local law would have it.
- Astrana does not support emancipation. Where local law treats something such as parenthood as making a minor an adult,
  Coming of Age still follows the age of majority.
