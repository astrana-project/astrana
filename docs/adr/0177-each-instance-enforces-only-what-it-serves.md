# 177. Each instance enforces only what it serves

Proposed.

## Context

Media from a peer travels from the sharing instance to the viewer's own instance, and from there to the viewer's
browser. The sharing instance checks which peers may see it
([record 103](0103-access-is-enforced-by-the-instance-that-holds-the-content.md)), but cannot see the accounts behind a
peer, and cannot see or control the browser at the other end. Anything that leaves an instance can be kept by those who
receive it ([record 176](0176-what-leaves-an-instance-can-be-kept-by-those-who-receive-it.md)).

## Decision

Each instance enforces only what it serves. The sharing instance checks the audience, sends only a display copy and
limits the requests of each peer. The viewer's instance decides which of its own accounts see what arrived, applies the
protections for delivering media to its own browser and the rules for saving it, and limits the requests of each
account. Neither instance asks for proof that the other runs unmodified software.

## Consequences

- An owner protecting their own media from collection in bulk relies on a limit per peer, which is a weaker guarantee
  than the limit per account the viewer's instance applies, and is described as such.
- A modified viewer instance could ignore what the sharer asked for. That is accepted, because the protections add
  friction and never claim to enforce.
- Requiring proof that a peer is unmodified was rejected, because no design could provide it without trusting the other
  machine, and demanding it would mean trusting somebody else's computer, which the whole design refuses.
- The sharing instance may cache its own display copies, because that content is its own. The viewer's instance holds
  peer media only in memory
  ([record 115](0115-an-instance-never-stores-a-peers-content-and-holds-it-only-in-memory-checking-with-the-sharer-before-each-use.md)).
