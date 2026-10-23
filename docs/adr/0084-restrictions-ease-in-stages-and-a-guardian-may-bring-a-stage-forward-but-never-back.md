# 84. Restrictions ease in stages, and a guardian may bring a stage forward but never back

Proposed.

## Context

A child's need for protection changes as they grow, and differs from one feature to another
([record 31](0031-when-a-child-owns-an-instance-a-parent-or-guardian-holds-authority-over-its-parental-controls.md)).

## Decision

Each parental restriction relaxes in stages as the child grows, setting by setting, each on its own timetable. The
stages are triggered by age. A guardian may bring a stage forward, but never push one back.

## Consequences

- Independence grows gradually, not all at once at Coming of Age.
- A feature with no particular risk for children has no stages at all.
- A guardian who brings a stage forward cannot undo it, and cannot hold a stage back past its age, even if they later
  judge that the child was not ready.
