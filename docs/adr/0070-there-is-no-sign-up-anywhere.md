# 70. There is no sign-up anywhere

Proposed.

## Context

Most services let anyone create an account, which is where bots and spam accounts come from.

## Decision

Every account is created by a specific person who already exists. An owner exists because they installed an instance,
and every other account is created or arranged by that owner
([record 40](0040-there-are-four-kinds-of-account-and-no-others.md)).

## Consequences

- There are no bots, no spam accounts and no puzzles to prove a person is human, because there is nowhere to sign up.
