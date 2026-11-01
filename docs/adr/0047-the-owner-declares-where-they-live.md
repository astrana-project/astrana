# 47. The owner declares where they live

Proposed.

## Context

Some defaults, such as the age of majority, depend on law that differs from place to place, and Astrana would otherwise
have to guess them for the owner ([record 1](0001-each-instance-has-one-owner-who-is-its-sole-administrator.md)). Law
and custom differ within countries as well as between them.

## Decision

When an instance is installed, and again from time to time, Astrana asks the owner which jurisdiction they live in. A
jurisdiction may be a country, a state, province, region or city within one, or a custom area the owner chooses. The
operating system's region setting only suggests an answer. Where the owner happens to be, judged from their time zone or
from the network address a request seems to come from, is never treated as where they live. On a child's instance the
answer is where the child lives, given by the guardian who sets it up.

## Consequences

- A traveller is not treated as living wherever they happen to be.
- An instance installed on rented hosting or from another computer takes the owner's jurisdiction, not the place where
  the hosting environment sits.
- The question is asked beside the owner's age, because the jurisdiction decides what an age means.
- The confirmation at setup is logged, with what was declared and what was shown.
- A declaration that does not match the region setting may prompt the owner to confirm it, and is never overridden.
- A false declaration changes the defaults that follow from it, such as the age of majority, and so can end a guardian's
  authority early.
