# 94. Resharing something publishes it anew, to the resharer's own audience

Proposed.

## Context

A connection reaches only the two people in it ([record 32](0032-a-connection-reaches-only-the-two-people-in-it.md)),
and every post has an audience chosen by its author ([record 44](0044-the-owner-chooses-who-each-post-is-for.md)).
Passing something on has to fit both.

## Decision

A reshare is a new act of publication. It goes to the resharer's own peers, under their own audience settings, never to
an audience the original author did not choose. It carries a count of how many times it has been passed on, and nothing
else about where it has been.

## Consequences

- Every step of spreading needs a person deciding to make something their own, to an audience they chose.
- The count shows distance, not the path, and modified software can forge it.
