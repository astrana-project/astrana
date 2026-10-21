# 33. A connection reaches only the two people in it

Proposed.

## Context

Once two people are connected ([record 2](0002-connections-are-mutual-and-nobody-follows-anyone.md)), the connection
could also give each of them a way to reach the other's connections.

## Decision

A connection reaches only the two people in it. A peer of a peer is not a peer, and nothing about being connected to
someone gives a way to find or reach the people they are connected to.

## Consequences

- Nobody can be found through somebody else's connections.
- A person's network is exactly the people they approved, and nobody else.
