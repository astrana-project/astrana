# 77. There is no sign-up anywhere

Proposed.

## Context

Most services let anyone create an account, which is where bots and spam accounts come from.

## Decision

Every account is created by a specific person who already exists. An owner exists because they installed an instance,
and every other account is created or arranged by that owner
([record 46](0046-there-are-four-kinds-of-account-and-no-others.md)).

## Consequences

- Nobody creates their own account on an instance, so there are no puzzles to prove a person is human.
- Anyone can still install an instance and send connection requests, and those are handled by mutual approval
  ([record 2](0002-connections-are-mutual-and-nobody-follows-anyone.md)).
