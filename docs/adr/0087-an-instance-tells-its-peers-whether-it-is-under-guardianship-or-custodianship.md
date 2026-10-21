# 87. An instance tells its peers whether it is under guardianship or custodianship

Proposed.

## Context

A guardian or a custodian may be able to read what reaches an instance, as well as its owner
([record 43](0043-there-are-four-kinds-of-account-and-no-others.md)).

## Decision

Each instance tells its peers whether it is under guardianship or custodianship, and tells them again whenever that
changes.

## Consequences

- A peer learns that what they send may be read by someone other than the owner.
- It is a declaration, and a hostile instance can simply leave it out.
