# 78. An account gets only what its role needs, settled in advance

Proposed.

## Context

Each kind of account other than the owner's exists for a particular job
([record 46](0046-there-are-four-kinds-of-account-and-no-others.md)).

## Decision

An account other than the owner's has exactly the access its role needs, and nothing more. What a role needs is settled
in the design in advance, not argued by the person holding it at the time. Access is never inherited from the account a
role is attached to.

## Consequences

- A guest sees the owner they are visiting, not the owner's peers.
- Guardians and custodians can see but not take part, because reacting, commenting and posting are not needed to keep a
  child safe or to preserve an instance.
- A capability fixed in advance is bounded, and one justified on the day is not.
