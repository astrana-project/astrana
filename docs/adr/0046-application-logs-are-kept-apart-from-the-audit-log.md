# 46. Application logs are kept apart from the audit log

Proposed.

## Context

An instance records two different things. One is what people did, which the owner may need to hold someone to account
for ([record 9](0009-every-material-action-is-logged-and-the-log-never-copies-content.md)). The other is how the
software is behaving, which helps diagnose faults.

## Decision

Application logs, which show whether the software is working and help diagnose it when it is not, are kept apart from
the audit log, which records what people did. They may use the same underlying logging tools, and serve different
purposes for different people.

## Consequences

- Machinery carrying out a decision already made, such as a scheduled task running, goes in the application log, not the
  audit log.
- Neither log stands in for the other.
