# 107. Apps acting for the owner use a narrow form of OAuth 2.1

Proposed.

## Context

A browser extension, a script, or any other app acting for the owner needs something it can hold that lets it in, and
that the owner can take back ([record 72](0072-people-sign-in-to-the-instance-itself.md)).

## Decision

An app acting for the owner uses OAuth 2.1, and only its authorisation code flow with Proof Key for Code Exchange
(PKCE). The owner starts the process, the token is limited to what was asked for, and the owner can revoke each token on
its own.

## Consequences

- Astrana needs only to issue a token and revoke it, and the rest of OAuth would add risk for no purpose.
- No app is ever given the owner's password, and no app needs a secret built into it, which anyone with a copy of the
  app could read.
