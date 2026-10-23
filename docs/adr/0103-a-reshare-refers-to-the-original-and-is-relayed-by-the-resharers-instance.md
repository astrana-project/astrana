# 103. A reshare refers to the original, and is relayed by the resharer's instance

Proposed.

## Context

A connection reaches only the two people in it ([record 36](0036-a-connection-reaches-only-the-two-people-in-it.md)),
every post has an audience chosen by its author ([record 48](0048-the-owner-chooses-who-each-post-is-for.md)), and an
instance never keeps a copy of a peer's content
([record 102](0102-an-instance-never-keeps-a-copy-of-a-peers-content.md)). Passing something on has to fit all three.
The resharer's peers are often not the author's, and the author's instance shows nothing to anyone it has no
relationship with.

## Decision

A reshare is a new post of the resharer's own, to an audience they choose, that refers to the original rather than
copying it. When one of the resharer's peers views it, the resharer's instance fetches the original fresh from the
author's instance, under the access the author gave the resharer, and passes it on without keeping it.

## Consequences

- Every step of spreading needs a person deciding to pass something on, to an audience they chose.
- A reshare reaches people the author did not choose. The author decides who sees the original, and each person who
  passes it on decides who sees their reshare.
- The author's instance only ever answers the resharer, so it never serves anyone it has no relationship with.
- When the author deletes the original, or it expires, it disappears from every reshare, because nothing was copied.
- When the author's instance cannot be reached, the reshare cannot show the original, and says so.
- Copying the original into the resharer's instance was rejected, because an instance never keeps a copy of a peer's
  content. Limiting a reshare to people who can already see the original was rejected, because it would let nothing be
  passed on at all.
