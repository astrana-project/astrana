# 33. An owner's age is declared, not verified

Proposed.

## Context

A child can own an instance ([record 32](0032-a-child-can-own-an-instance.md)), and protections for children depend on
knowing who is a child. Checking age reliably needs identity documents, a third party that vouches for them, or both.

## Decision

An owner's age is declared, and nothing verifies it.

## Consequences

- No approach available to a self-hosted project can reliably check age, and Astrana does not claim to.
- Protections for children rest on an honest declaration, so they will not stop a determined teenager.
- No identity document or outside party is involved in setting up an instance.
- Verifying age through an outside service was rejected, because it would tie every instance to that service and tell it
  who runs an instance.
