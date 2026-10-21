# 127. An instance checks what it can about its host, rather than asking the owner

Proposed.

## Context

An owner could be given a list of requirements to check, or the instance could find out for itself what it can
([record 113](0113-what-an-instance-finds-about-its-host-is-told-to-its-owner-and-nobody-else.md)).

## Decision

An instance checks what it can observe about where it is running, such as whether encryption at rest is actually
available and whether secure connections end where they should, and reports what it found. It never shows itself as
protected when it could not verify that.

## Consequences

- A check asks nothing of the owner and cannot be misread, where a published checklist can be ticked and still give
  false comfort.
- The difference between something set up and something that could not be verified is always shown.
