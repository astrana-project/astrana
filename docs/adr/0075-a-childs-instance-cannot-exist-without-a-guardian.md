# 75. A child's instance cannot exist without a guardian

Proposed.

## Context

A child can own an instance ([record 42](0042-a-child-can-own-an-instance-and-age-is-declared-rather-than-verified.md)),
and a parent or guardian holds authority over its parental controls
([record 30](0030-when-a-child-owns-an-instance-a-parent-or-guardian-holds-authority-over-its-parental-controls.md)).

## Decision

When an instance is created for a child, at least one parent or guardian account is created during setup, so an instance
representing a child never exists, even for a moment, without one.

## Consequences

- There is no time in which a child's instance runs with nobody able to configure its protections.
