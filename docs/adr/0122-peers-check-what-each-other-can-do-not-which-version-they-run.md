# 122. Peers check what each other can do, not which version they run

Proposed.

## Context

Owners update when they choose, so at any moment peers run many different versions
([record 65](0065-peers-talk-directly-over-https-with-a-websocket-channel-for-notifications.md)).

## Decision

Instances test what each other support, rather than comparing version numbers. Anything an instance does not recognise
is ignored. A request it does not implement is refused with an answer. A feature that needs both sides is unavailable
between that pair.

## Consequences

- Nobody is forced to update by their peers.
- An older peer never degrades anything for a newer one beyond the feature itself.
- An older peer that lacks a security feature keeps working with the protection it has, which is less.
- The combinations of what peers support grow with every release, and so does what has to be tested.
