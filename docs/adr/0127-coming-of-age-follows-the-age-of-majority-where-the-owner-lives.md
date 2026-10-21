# 127. Coming of Age follows the age of majority where the owner lives

Proposed.

## Context

Coming of Age ends a guardian's authority
([record 83](0083-at-coming-of-age-a-guardians-authority-ends-completely-and-automatically.md)), and the age of majority
differs from country to country
([record 113](0113-a-jurisdiction-selects-a-small-set-of-values-not-special-behaviour.md)).

## Decision

Coming of Age is the age of majority in the owner's declared jurisdiction. Where none is declared, it is 18.

## Consequences

- Eighteen is the conservative side of the range, so an owner who says nothing gets the more protective treatment.
- Where local law treats something such as parenthood as making a minor an adult, the declared jurisdiction decides.
  Astrana does not implement that idea itself.
