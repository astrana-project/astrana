# 23. Media is always served through the application, never as direct access to a file

Proposed.

## Context

Media can be served by handing out a direct address for a stored file, or by passing each request through the
application. A direct address works for anyone who has it, and bypasses every check the application makes about who may
see what.

## Decision

Media is always served through the application itself, never as direct access to a stored file, wherever the file is
kept.

## Consequences

- Every request for media passes the same checks as any other request for content.
- The original, which keeps its hidden details ([record 22](0022-an-uploaded-original-is-never-altered.md)), cannot be
  reached by guessing an address.
- The application carries all media traffic itself, which costs bandwidth and processing on the instance's machine.
- Serving files directly from storage, or through a content delivery network, was rejected because a direct address
  would grant access outside the application's checks.
