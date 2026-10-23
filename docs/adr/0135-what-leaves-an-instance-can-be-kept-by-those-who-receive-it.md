# 135. What leaves an instance can be kept by those who receive it

Proposed.

## Context

Content leaves an instance whenever it is shown to someone. Some of it is also stored on other instances, such as a
comment written on someone else's post, which lives on that person's instance
([record 43](0043-the-owner-of-an-instance-may-remove-anything-stored-on-it-except-a-report-about-their-content.md)). An
instance never keeps a copy of a peer's content
([record 104](0104-an-instance-never-keeps-a-copy-of-a-peers-content.md)), but people and their devices are another
matter.

## Decision

Astrana treats anything that has left an instance as something its recipients may keep, and never claims to prevent it.

## Consequences

- A screenshot cannot be prevented.
- A comment someone writes is held by the owner of the instance it lives on.
- Deleting or expiring content on one instance cannot recall what has already been seen or kept elsewhere.
- An owner's content is protected only as well as the people and devices that receive it, which is why every owner's
  security matters to their peers.
