# 51. Notifications travel by Web Push, with email only as a supplement

Proposed.

## Context

Notifications have to reach a person who is not looking at their instance, through the app they installed
([record 19](0019-the-app-is-a-progressive-web-app-served-by-each-instance.md)) or some other channel.

## Decision

Notifications are delivered by Web Push, an open standard that encrypts what it carries. For notifications, email is an
optional supplement where the owner has set it up, never the main channel. Text messages are not used.

## Consequences

- A push service sees which device subscription a message goes to and when, but not what it says. On some platforms the
  browser routes it through Apple's or Google's push service.
- Delivery cannot be guaranteed, so what the owner sees when they next open their instance is the record they can rely
  on.
- Two-factor codes and sign-in links are not notifications, and email may be the only way they arrive.
- Text messages were rejected, because each one costs money and needs a commercial relationship.
