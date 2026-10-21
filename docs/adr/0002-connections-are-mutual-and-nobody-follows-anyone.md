# 2. Connections are mutual, and nobody follows anyone

Proposed.

## Context

Astrana is designed for connecting with people you already know. Whether a connection needs both people's agreement
decides who can see what a person shares.

## Decision

Two instances become peers only when both owners approve the connection, and either of them may end it. There is no
following, so nobody can receive someone's posts without having agreed to receive theirs.

## Consequences

- Neither person in a connection is an audience for the other.
- One-way following was rejected, because it would let a person gather an audience that never agreed to be one.
