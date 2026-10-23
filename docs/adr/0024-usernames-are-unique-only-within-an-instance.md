# 24. Usernames are unique only within an instance

Proposed.

## Context

Accounts need names that do not clash, and Astrana has no central service.

## Decision

A username needs to be unique only on the instance that created it. There is no global register of names.

## Consequences

- No central service is needed to hand out names.
- Two people on different instances can have the same username, so a name alone cannot identify a peer. People are told
  apart by the instance each belongs to.
