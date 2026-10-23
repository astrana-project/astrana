# 82. A child cannot remove their guardian

Proposed.

## Context

Parental controls
([record 34](0034-when-a-child-owns-an-instance-a-parent-or-guardian-holds-authority-over-its-parental-controls.md))
protect a child only if the child cannot simply switch them off.

## Decision

A child cannot remove or revoke a guardian's account, and the design guards against getting around that.

## Consequences

- A rule that could be bypassed would protect nobody.
- A child who controls the machine the instance runs on can still reinstall or alter it, which this cannot prevent.
