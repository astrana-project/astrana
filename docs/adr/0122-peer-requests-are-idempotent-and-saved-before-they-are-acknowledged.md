# 122. Peer requests are idempotent and saved before they are acknowledged

Proposed.

## Context

A sending instance retries a comment or post until it is accepted or its time to live runs out
([record 121](0121-an-outgoing-comment-or-post-is-held-at-most-briefly-for-delivery-and-every-request-has-a-time-to-live.md)).
A retry can arrive after the first attempt succeeded, and a crash can come between receiving a request and recording it.

## Decision

Every request that changes something carries an idempotency key. The receiving instance remembers the keys it has
recently processed and returns the original result to a repeat. An incoming request is saved, in the same transaction as
its effect, before it is acknowledged. There is no inbound queue.

## Consequences

- A retry cannot duplicate a comment, reaction or post.
- A crash before the save leaves the sender unacknowledged, so its outbox retries and the key stops a duplicate.
  Acknowledging first would let the sender delete its copy before the receiver had one, and the item would be lost.
- Keys are kept only a little longer than a request's time to live and then deleted, because they are a record of
  activity and are never kept as a history.
- An inbound queue was rejected, because it would itself have to be durable, adding a second place where requests can be
  lost, and it would not help with outages, since nothing reaches an instance that is down.
