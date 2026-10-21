# 120. Peers check what each other can do, not which version they run

Proposed.

## Context

Owners update when they choose, so at any moment peers run many different versions
([record 64](0064-peers-talk-directly-over-https-with-a-websocket-channel-for-notifications.md)).

## Decision

Instances test what each other support, rather than comparing version numbers. Anything an instance does not recognise
is ignored. A request it does not implement is refused with an answer. A feature that needs both sides is simply
unavailable between that pair.

## Consequences

- Nobody is forced to update by their peers.
- An older peer never degrades anything for a newer one beyond the feature itself.
