# 21. An instance runs as one copy of the application, with one database

Proposed.

## Context

An instance serves one person and the few people around them
([record 20](0020-each-person-is-represented-by-one-instance.md)), and is usually looked after by that person alone.
Running an application as several copies across several servers keeps it available when one fails, at the cost of
coordination between the copies. Many hosting plans also allow only one database.

## Decision

An instance runs as one copy of the application, with one database. It is not spread across several servers.

## Consequences

- Nothing has to keep several copies of the application in step.
- An instance is unavailable while its one copy is down, such as when its machine is off or being updated. The design
  treats that downtime as routine.
- Resilience comes from backups, not from a second live copy.
- An instance works fully on a hosting plan that allows a single database. A restore loads the backup into staging
  tables inside that same database, checks them and swaps them in for the live tables in one step, so it needs no second
  database, and the previous tables are kept in the same database for a while as the way back.
- A restore needs room for about twice the data while it runs, and the instance holds writes before the swap so that
  nothing written during the restore is lost.
- A second database is still recommended where the hosting plan allows one, because it lets a restore be rehearsed
  entirely apart from the live data.
- Spreading one instance across several servers was rejected, because it would add coordination, machines and upkeep for
  an owner who usually looks after the instance alone, to remove downtime the design already accepts. Restoring by
  writing straight into the live tables was rejected, because a failure part way would leave the owner's data mixed and
  uncertain.
