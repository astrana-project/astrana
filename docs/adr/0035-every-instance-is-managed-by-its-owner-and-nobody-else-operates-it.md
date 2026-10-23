# 35. Every instance is managed by its owner, and nobody else operates it

Proposed.

## Context

Most people cannot set up and look after a server, and many who could would rather not. Someone else could run an
instance for them, but an instance has to be its owner's and nobody else's
([record 1](0001-each-instance-has-one-owner-who-is-its-sole-administrator.md)).

## Decision

Every instance is managed by its owner, who installs, configures and looks after Astrana, its database and its
encryption keys. Nobody else runs or manages an instance on the owner's behalf.

## Consequences

- A friend, a relative or a paid technician may set an instance up and hand it over, and the owner still ends up with
  sole authority over it.
- A hosted Astrana service, run by someone other than the owner, was ruled out, because authority over the instance
  would then sit permanently with somebody else.
