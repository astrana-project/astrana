# 52. Albums exist on their own, and posts refer to them

Proposed.

## Context

Most things attached to a post exist only inside it
([record 8](0008-a-post-is-a-container-and-what-it-holds-shares-its-audience-and-its-life.md)), and albums are kept
collections people return to.

## Decision

An album is not held inside a post. It exists independently, and a post that shares it attaches it by reference.

## Consequences

- Albums are the one exception to the container rule.
- An album has its own lifetime, separate from any post that shares it.
