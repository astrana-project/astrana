# 97. Notifications are batched, and only material impact interrupts

Proposed.

## Context

A notification takes some of a person's attention whether or not they act on it
([record 51](0051-notifications-travel-by-web-push-with-email-only-as-a-supplement.md)). How often a person is
interrupted matters more than how long they spend, and most of what happens on an instance is worth knowing without
being worth an interruption.

## Decision

Notifications are batched by default. A notification interrupts only when what it reports has material impact, meaning
it negatively and significantly affects the person's health, safety, security or personal sovereignty, and no other part
of the instance would make them aware in time to act.

## Consequences

- Everything that happens is on the instance for the owner to find, whether or not it was delivered as an interruption.
- A batched notification arrives later than it would have alone, which is the cost of fewer interruptions.
- Something with material impact, such as a sign-in from an unfamiliar setting, reaches the owner even when they have
  muted or deferred notifications.
- The owner controls which notifications they get, how often and when, for everything below that test.
- Delivering every notification as it happens was rejected, because each interruption is a cost whether or not the
  person acts on it.
