# 66. An instance does not tell its peers about its own actions, and peers ask

Proposed.

## Context

An instance does things its peers might want to know about, such as ending a connection, restoring from a backup,
changing its settings or being offline for a while. Telling peers each time would mean sending messages nobody asked
for, and each one would say something about the instance and its owner. Peers already ask for what they need, and the
instance holding something decides what to return
([record 51](0051-a-request-to-a-peer-is-a-request-never-a-demand.md)).

## Decision

An instance does not tell its peers about actions it takes. A peer learns what it needs by asking, and the instance
asked chooses what it is willing to return or refuse.

## Consequences

- Nothing about an instance's own events leaves it unless a peer asks and the instance chooses to answer.
- A peer's view of another instance can be out of date until it next asks, as with a disconnection
  ([record 65](0065-a-former-peer-learns-of-a-disconnection-when-they-next-ask.md)).
- A restore is never announced. Something a peer tried to send while it ran fails at the time, and the sender is told
  and can try again.
- A mechanism that would show peers an instance's own actions, such as a marker that changes when it is restored, is
  ruled out on the same grounds as a message saying so.
- Any case where peers are told is an exception that needs a decision of its own.
- Announcing changes to peers was rejected, because each announcement leaks something about the instance, and needs
  sending, retrying and acknowledging for no request anyone made.
