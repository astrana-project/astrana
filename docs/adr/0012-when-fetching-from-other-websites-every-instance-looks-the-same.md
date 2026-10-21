# 12. When fetching from other websites, every instance looks the same

Proposed.

## Context

An instance sometimes fetches things from websites it has no relationship with, such as the page behind a shared link.
How it identifies itself decides whether those websites can tell instances apart.

## Decision

When fetching from a website it has no relationship with, an instance identifies itself with a plain identifier that is
the same on every instance and stays fixed within a release. To its peers it identifies itself honestly and in a way
they can verify.

## Consequences

- A website cannot tell one instance from another.
- Changing the identifier on each request was rejected, because a value that keeps changing is a pattern of its own.
- Deriving the identifier from each host machine was rejected, because it would make every instance distinctive.
