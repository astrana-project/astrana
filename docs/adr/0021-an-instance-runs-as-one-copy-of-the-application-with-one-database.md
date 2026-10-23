# 21. An instance runs as one copy of the application, with one database

Proposed.

## Context

An instance serves one person and the few people around them
([record 20](0020-each-person-is-represented-by-one-instance.md)), and is usually looked after by that person alone.
Running an application as several copies across several servers keeps it available when one fails, at the cost of
coordination between the copies.

## Decision

An instance runs as one copy of the application, with one database. It is not spread across several servers.

## Consequences

- Nothing has to keep several copies of the application in step.
- An instance is unavailable while its one copy is down, such as when its machine is off or being updated. The design
  treats that downtime as routine.
- Resilience comes from backups, not from a second live copy.
- Spreading one instance across several servers was rejected, because it would add coordination, machines and upkeep for
  an owner who usually looks after the instance alone, to remove downtime the design already accepts.
