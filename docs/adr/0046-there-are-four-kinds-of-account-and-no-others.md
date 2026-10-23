# 46. There are four kinds of account, and no others

Proposed.

## Context

Some people need a part in someone else's instance without running their own
([record 1](0001-each-instance-has-one-owner-who-is-its-sole-administrator.md)). Examples are a parent of a child owner,
a trusted person for an owner who can no longer act, and a relative who will never run an instance.

## Decision

An instance has four kinds of account. These are its owner, a parent or guardian, a custodian, and a guest. There is no
administrator, moderator or any other role.

## Consequences

- Every account other than the owner's exists in service of, and in relation to, the owner.
- Nobody can be given delegated administration of an instance. Administrator and moderator roles were rejected, because
  authority over an instance never leaves its owner.
