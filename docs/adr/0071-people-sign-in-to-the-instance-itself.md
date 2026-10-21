# 71. People sign in to the instance itself

Proposed.

## Context

Everyone who uses an instance has to sign in to it
([record 1](0001-each-instance-has-one-owner-who-is-its-sole-administrator.md)). Signing in through an outside identity
provider would let that provider see every time anyone signs in.

## Decision

Owners and guests sign in to the instance itself, which keeps their accounts. No outside identity provider is involved,
for any kind of account.

## Consequences

- No outside party sees when anyone signs in.
- Signing in is part of what the owner already runs
  ([record 31](0031-every-instance-is-managed-by-its-owner-and-nobody-else-operates-it.md)).
- Signing in with an account from a large platform, or through a shared sign-in service, was rejected for this reason.
