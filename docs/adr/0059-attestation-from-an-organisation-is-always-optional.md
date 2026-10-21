# 59. Attestation from an organisation is always optional

Proposed.

## Context

An organisation can vouch for someone's relationship with it, such as being an employee or a member, and that can help a
peer decide whether to connect ([record 2](0002-connections-are-mutual-and-nobody-follows-anyone.md)).

## Decision

An owner may offer an attestation from an organisation, and a peer may weigh it, but it is never required. A peer
without one is the ordinary case. Astrana neither suggests nor weights an attestation, and shows it as a fact at the
moment of approval, never as a verdict.

## Consequences

- Nobody is ever tied to an organisation in order to use Astrana.
- Each relationship presents its own attestation, and reveals nothing about any other.
- Nothing from an attestation is kept after a disconnection.
