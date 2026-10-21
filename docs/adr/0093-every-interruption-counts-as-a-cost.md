# 93. Every interruption counts as a cost

Proposed.

## Context

A notification takes some of a person's attention whether or not they act on it
([record 47](0047-notifications-travel-by-web-push-with-email-only-as-a-supplement.md)).

## Decision

Every notification is treated as a cost to the person receiving it. Notifications are batched by default, and only what
passes a test of material impact may interrupt.

## Consequences

- How often a person is interrupted matters more than how long they spend, so a few batched notifications are better
  than many.
- The owner controls which notifications they get, how often and when.
