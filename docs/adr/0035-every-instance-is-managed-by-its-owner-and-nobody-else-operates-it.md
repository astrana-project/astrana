# 35. Every instance is managed by its owner, and nobody else operates it

Proposed.

## Context

Most people cannot set up and look after a server, and many who could would rather not. Someone else could run an
instance for them, but an instance has to be its owner's and nobody else's
([record 1](0001-each-instance-has-one-owner-who-is-its-sole-administrator.md)).

## Decision

Astrana is built for each instance to be managed by its owner, who installs, configures and looks after it, its database
and its encryption keys. Astrana provides no way for anyone else to administer an instance on the owner's behalf, such
as remote management or one installation serving several owners, and the project runs no hosted service.

## Consequences

- A friend, a relative or a paid technician may set an instance up and hand it over, and the owner still ends up with
  sole authority over it.
- A hosting provider may run the machine an instance is on. Running the machine is not administering the instance.
- Open-source software cannot stop someone from running instances for other people using their sign-in details, and
  Astrana does not claim to. It offers nothing that makes doing so easier.
- A hosted Astrana service run by the project was ruled out, because authority over every instance on it would then sit
  permanently with somebody else.
