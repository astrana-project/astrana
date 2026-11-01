# 121. An outgoing comment or post is held at most briefly for delivery, and every request has a time to live

Proposed.

## Context

A comment or post written for another instance lives there, and the author's instance keeps no lasting copy
([record 45](0045-the-owner-of-an-instance-may-remove-anything-stored-on-it-except-a-report-about-their-content.md)). If
the other instance is briefly unreachable, the item is lost unless something holds it. Holding things for people who are
offline is what direct messaging would need, and Astrana has none
([record 120](0120-astrana-has-no-direct-messaging.md)).

## Decision

Every request between peers carries a time to live. A comment or post sent to a peer is saved in a local outbox in the
same database transaction that creates it, and sent straight away. If the peer cannot be reached, the instance retries
until the time to live, five minutes, runs out, and then tells the person it could not be sent. The outbox copy is
encrypted at rest, cancelled if the person deletes the item, and deleted as soon as the peer accepts it.

## Consequences

- A comment written during a peer's brief outage or restore is delivered rather than lost.
- The author's instance holds a copy of what it sent elsewhere for delivery and nothing else, and only for minutes.
- The time to live is what keeps the outbox from becoming a store of messages for people who are offline, so it is a
  limit the design depends on rather than a setting to tune. A later wish to hold something a little longer for
  reliability has to be weighed against that.
- A peer that has ended the connection refuses the first retry, and the item is dropped at once, so the outbox never
  keeps pressing an instance that has said no.
- Requests that arrive after their time to live are refused, so a delayed request cannot act long after it was meant.
