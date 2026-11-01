# 67. Silence never ends a connection

Proposed.

## Context

A peer can stop answering for many ordinary reasons, such as illness, a broken computer, a local outage or travel.
Signals about a peer inform the owner and never act by themselves
([record 61](0061-signals-about-a-peer-inform-the-owner-and-never-act-by-themselves.md)). Retrying a silent address
forever has costs of its own, because the address may come to belong to someone else.

## Decision

A connection is never ended because a peer has gone quiet, and is never removed automatically. After about two weeks
without hearing from a peer, the owner is told. After about thirty days the instance stops trying to reach it, unless
the owner chooses to try again.

## Consequences

- A peer that returns after a long absence finds the connection as it was, and still has to prove the key its instance
  was first known by ([record 38](0038-peers-recognise-each-other-by-keys-remembered-when-they-first-connect.md)).
- The prompt to the owner never says the connection has ended, only that the peer has not been heard from.
- Where an address answers with a different key after a long silence, the warning says plainly that it is probably a
  different machine, and the new key is never accepted silently.
- Stopping after thirty days avoids traffic that could look like spam or an attack to whoever has the address by then,
  avoids telling them about the connection, and saves resources.
- Peers telling each other that a connection has ended was rejected, because it would reveal who is connected to whom.
