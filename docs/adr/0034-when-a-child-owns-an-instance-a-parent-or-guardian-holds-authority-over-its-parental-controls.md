# 34. When a child owns an instance, a parent or guardian holds authority over its parental controls

Proposed.

## Context

An instance has one owner, who is its only administrator
([record 1](0001-each-instance-has-one-owner-who-is-its-sole-administrator.md)). A child can own an instance, and some
of its settings exist to keep the child safe.

## Decision

When a child owns an instance, a parent or guardian has an account with real authority over the child's parental
controls. A guardian may also reset the child owner's lockout. The authority covers nothing else on the instance.

## Consequences

- For parental controls, and only for them, the person using the instance and the person administering it are two
  different people.
- Children lock themselves out by mistake, and a guardian's reset gives them a way back in that needs no access to the
  host machine.
- Keeping the authority this narrow stops it becoming a general exception to one owner, one administrator.
