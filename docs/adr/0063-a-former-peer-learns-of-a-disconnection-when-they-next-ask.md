# 63. A former peer learns of a disconnection when they next ask

Proposed.

## Context

Either person can end a connection ([record 2](0002-connections-are-mutual-and-nobody-follows-anyone.md)), and the
other's instance still holds a record of it.

## Decision

When an owner ends a connection, nothing is sent. The former peer's next request is refused with the reason, which is
how they learn the connection has ended.

## Consequences

- Ending a connection needs no message, no retry and no acknowledgement.
- The former peer's record is corrected by the refusal, and their stale belief never grants access.
- Until it next asks, the former peer's view of the connection is out of date.
- The instance has to remember a former peer's key, so that it can recognise them and refuse with the reason.
