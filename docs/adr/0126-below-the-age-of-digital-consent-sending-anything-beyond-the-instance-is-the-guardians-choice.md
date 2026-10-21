# 126. Below the age of digital consent, sending anything beyond the instance is the guardian's choice

Proposed.

## Context

Some choices send data beyond an instance on its owner's behalf, such as telemetry, and law sets an age below which a
child cannot consent to that alone
([record 112](0112-a-jurisdiction-selects-a-small-set-of-values-not-special-behaviour.md)).

## Decision

Until a child reaches the age of digital consent in their jurisdiction, any choice that sends data beyond their instance
on their behalf belongs to their guardian
([record 30](0030-when-a-child-owns-an-instance-a-parent-or-guardian-holds-authority-over-its-parental-controls.md)).
The handover is triggered by age and only moves forward.

## Consequences

- A guardian's say over these choices ends at the age of digital consent, which can come before Coming of Age.
