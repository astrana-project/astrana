# 112. A sign-in from somewhere unfamiliar is reported to the owner, as reliably as it can be

Proposed.

## Context

People sign in to the instance itself ([record 68](0068-people-sign-in-to-the-instance-itself.md)), so an unfamiliar
sign-in may be the first sign that someone else has got in.

## Decision

When someone signs in from a setting not seen before, the owner is told, by notification
([record 46](0046-notifications-travel-by-web-push-with-email-only-as-a-supplement.md)) and by email where they have set
it up. The record of sign-ins on the instance is what the owner can rely on.

## Consequences

- Astrana cannot guarantee an alert arrives, and does not claim to.
- An alert sent by email survives an attacker who has taken over the instance, but reaches the attacker too if the
  mailbox was how they got in.
