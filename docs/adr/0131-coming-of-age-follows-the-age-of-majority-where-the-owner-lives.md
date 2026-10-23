# 131. Coming of Age follows the age of majority where the owner lives

Proposed.

## Context

Coming of Age ends a guardian's authority
([record 86](0086-at-coming-of-age-a-guardians-authority-ends-completely-and-automatically.md)), and the age of majority
differs from country to country
([record 117](0117-a-jurisdiction-selects-a-small-set-of-values-not-special-behaviour.md)).

## Decision

Coming of Age is the age of majority in the owner's declared jurisdiction. Where none is declared, the universal profile
applies ([record 130](0130-an-owner-may-decline-to-say-where-they-live-and-then-gets-the-most-protective-defaults.md)).

## Consequences

- Some jurisdictions set the age of majority at 19 or 21, so an owner who declares nothing may reach Coming of Age
  earlier than local law would have it.
- Astrana does not support emancipation. Where local law treats something such as parenthood as making a minor an adult,
  Coming of Age still follows the age of majority.
