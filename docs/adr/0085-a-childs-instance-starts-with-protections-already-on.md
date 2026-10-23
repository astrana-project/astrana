# 85. A child's instance starts with protections already on

Proposed.

## Context

A guardian may never get round to configuring anything
([record 31](0031-when-a-child-owns-an-instance-a-parent-or-guardian-holds-authority-over-its-parental-controls.md)),
and a child's instance needs protection from its first moment
([record 30](0030-a-child-can-own-an-instance-and-age-is-declared-rather-than-verified.md)).

## Decision

A child's instance starts with a baseline of protections in place the moment it is known to be a child's, before anyone
configures anything, such as video that does not play by itself and a cautious default audience. That the instance
starts protected is built into the software, and no configuration file can switch it off. Once it is running, a guardian
may adjust any of the protections through the app's parental controls, except that a stage that has eased cannot be
pushed back ([record 84](0084-restrictions-ease-in-stages-and-a-guardian-may-bring-a-stage-forward-but-never-back.md)).

## Consequences

- A child is protected even when a guardian sets nothing up.
- The baseline is a starting point, not a lock.
- A protection eases in stages as the child grows only if its feature carries a particular risk for children, the same
  test as for any other control
  ([record 84](0084-restrictions-ease-in-stages-and-a-guardian-may-bring-a-stage-forward-but-never-back.md)).
