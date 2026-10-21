# 44. The owner declares where they live

Proposed.

## Context

Some defaults, such as the age of majority, depend on law that differs from place to place, and Astrana would otherwise
have to guess them for the owner ([record 1](0001-each-instance-has-one-owner-who-is-its-sole-administrator.md)).

## Decision

At setup, and again from time to time, Astrana asks the owner which country and region they live in. The computer's
language settings only suggest an answer. Where the owner happens to be, judged from their time zone or from where a
request seems to come from, is never treated as where they live.

## Consequences

- A traveller is not treated as living wherever they happen to be.
- The confirmation at setup is logged, with what was declared and what was shown.
- A declaration that does not match the language settings may prompt the owner to confirm it, and is never overridden.
