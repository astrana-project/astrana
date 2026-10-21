# 3. Times are recorded in UTC

Proposed.

## Context

Sign-ins, content expiry, scheduled tasks, connections between peers, checks for new versions and everything else that
records a time need one standard form. An instance exchanges times with peers whose machines may be set to other time
zones, and with the web app, wherever the people using it happen to be. An instance can also move to a machine in a
different time zone, and its stored times must mean the same afterwards.

## Decision

Every date and time is recorded in Coordinated Universal Time (UTC), whatever time zone the host machine is set to.
Times exchanged with peers and with the web app are in UTC too, written in the International Organization for
Standardization (ISO) 8601 format with an explicit `Z`.

## Consequences

- Changing how times are stored once data exists is costly, so this is settled at the foundation.
- A time from a peer cannot be misread because of the zone its machine is set to. UTC settles which zone a time is in,
  not whether the clock that produced it was right, and an instance still depends on a roughly correct clock.
- On databases whose date and time types carry no zone, the backend reads and writes the stored value as UTC whatever
  the host's zone, because converting through the host's zone would shift every time on a host not set to UTC.
- Showing a time to a person, in their own time zone and format, is a matter for localisation.
- Recording local time with an offset was rejected. Every value would need converting before times could be compared or
  ordered, and times recorded in the host's zone would change meaning when the instance moves.
