# 109. A push notification says only what kind of thing happened

Proposed.

## Context

Notifications travel by Web Push
([record 53](0053-notifications-travel-by-web-push-with-email-only-as-a-supplement.md)), encrypted so the push service
cannot read them, but the browser that shows a notification can. A browser may flag a notification as possible spam, and
reporting that as a mistake sends its content and the instance's address to the browser's vendor, who may have people
review it.

## Decision

A push notification carries only what kind of thing happened, such as "You have a new comment". Who did it and what it
says are shown only inside Astrana.

## Consequences

- A report to a browser vendor, or anyone who sees the screen, learns only that something of a kind happened.
- The person has to open Astrana to see what a notification is about.
- The same rule holds for email.
- Push delivery differs between browsers and platforms, and at ordinary urgency a notification can take minutes to reach
  a locked phone, so a notification that must arrive promptly is sent with high urgency, and an important alert also
  waits in the app or goes by email
  ([record 108](0108-notifications-are-batched-and-only-material-impact-interrupts.md)).
