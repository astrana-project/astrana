# 9. Every material action is logged, and the log never copies content

Proposed.

## Context

When something goes wrong, an owner needs to know what happened, who did it and when. A record that copied content, or
noted every look, would itself become a store of what people wrote and did.

## Decision

Every material action, whether taken by a person, by a peer or by the instance itself, is written to the instance's
audit log, recording what happened, who did it and when. The log never holds a copy of the content involved. Reading,
viewing and searching are not logged.

## Consequences

- A deletion is recorded as a fact, and the deleted content is not preserved, so the log and expiry do not undo each
  other.
- Looking is never logged, because a record of what someone looked at is exactly the record of behaviour Astrana refuses
  to build.
- What a search leads to, such as a deletion or a disconnection, is logged.
- A guardian can see the security events and the outline of a child's log, not its detail.
- The log is itself a record of who did what on the instance, and needs the same protection as anything else it holds.
- The log grows with every material action, without end unless old entries are removed.
