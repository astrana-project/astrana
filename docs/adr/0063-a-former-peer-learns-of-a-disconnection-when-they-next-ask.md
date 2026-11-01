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
- Ending a connection is not ending an instance. An instance sends its peers something they did not ask for in only two
  cases, which are the signed ending when the instance itself is closed and the revocation of a key that signs its
  transport keys. A peer that waited to ask would go on trusting an identity that has ended or a key that has been stolen.
