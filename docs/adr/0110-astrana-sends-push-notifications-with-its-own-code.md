# 110. Astrana sends push notifications with its own code

Proposed.

## Context

Sending Web Push means signing each message for the push service and encrypting its content to the subscriber, as two
published standards describe ([record 109](0109-a-push-notification-says-only-what-kind-of-thing-happened.md)). Astrana
uses an outside component only where it must, and prefers mature ones
([record 4](0004-astrana-depends-on-outside-components-only-where-it-must.md)).

## Decision

Astrana implements sending Web Push itself, on the cryptography built into the runtime, following the two published
standards. It is tested against the standards' test vectors and against each push service, and a test confirms that
every message uses a fresh random value.

## Consequences

- The code is small, and its mistakes show up loudly. A bad signature is refused by the push service, and bad encryption
  means no notification appears.
- Reused randomness is the one mistake that would fail quietly, which is why it has a test of its own.
- The project maintains the code itself, and keeps it current with the standards.
- The established package for this was rejected, because it rests on one maintainer, and another was rejected because it
  uses an encoding from before the standard.
