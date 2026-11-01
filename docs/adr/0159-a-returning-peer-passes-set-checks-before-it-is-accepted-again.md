# 159. A returning peer passes set checks before it is accepted again

Proposed.

## Context

A peer that has been away may come back as itself, as a copy restored somewhere else, as someone else holding its
machine, or after its identity was retired. Telling these apart must not reveal to peers that a restore happened
([record 152](0152-the-ed25519-identity-key-signs-a-revocable-rotation-key-which-signs-hourly-x25519-transport-keys.md)).

## Decision

A returning peer must prove the identity key that was pinned, and that key must have signed, through its rotation key,
the transport key it presents. A held ending refuses the return, whatever else is presented
([record 156](0156-an-identity-is-retired-by-a-signed-ending-never-signed-in-advance-and-peers-are-told-neutrally.md)).
A properly signed rollover is accepted and the person told
([record 153](0153-an-identity-key-is-replaced-by-a-signed-rollover-with-an-overlap.md)), and an unsigned change of key
gets the changed-key warning. The person sees a notice that the peer is back after an absence, and from a new location
where its address changed. The returning instance checks that it is the same installation, and stays held if it was
restored onto another machine. Its own owner is told on every channel that it reconnected. An instance that is out of
date reconnects with a warning rather than being blocked.

## Consequences

- Telling the returning instance's owner on every channel means that somebody else bringing it back can be noticed.
- No check depends on anything that changes only on a restore, so none of them reveals one.
- Nobody is shut out by their peers for not updating
  ([record 143](0143-peers-check-what-each-other-can-do-not-which-version-they-run.md)).
- A peer's person learns that the peer is back, and that it moved, but nothing about why.
