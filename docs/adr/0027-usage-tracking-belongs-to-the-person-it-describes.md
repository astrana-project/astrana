# 27. Usage tracking belongs to the person it describes

Proposed.

## Context

Tracking how long someone uses Astrana can help them notice their own habits. The same record, shown to anyone else, is
a record of their behaviour.

## Decision

Records of how long someone uses Astrana are shown only to that person, never in an administrative dashboard. Switching
tracking off deletes its history, after a window in which it can be exported.

## Consequences

- A person's habits are never shown to anyone else, including the owner of an instance where they have a guest account.
- A guardian's outline of a child's activity is the one bounded exception, and the child's own usage check is never
  routed to it.
