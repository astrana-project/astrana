# 85. Guardianship is declared, not verified

Proposed.

## Context

Age is declared, not verified ([record 33](0033-an-owners-age-is-declared-not-verified.md)), and a parent or guardian
holds authority over a child's instance
([record 34](0034-when-a-child-owns-an-instance-a-parent-or-guardian-holds-authority-over-its-parental-controls.md)). A
self-hosted instance has no means of confirming that a person is an adult or that a family relationship is real.

## Decision

Nothing checks that a guardian is an adult or that a claimed relationship is real. There is no age gate on guardian
accounts. The arrangement is made visible instead.

## Consequences

- A minor who is a parent remains a child owner, and cannot hold a guardian account over their own child's instance.
