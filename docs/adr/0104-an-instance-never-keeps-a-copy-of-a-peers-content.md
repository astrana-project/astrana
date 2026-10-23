# 104. An instance never keeps a copy of a peer's content

Proposed.

## Context

Content shared between peers ([record 2](0002-connections-are-mutual-and-nobody-follows-anyone.md)) could be copied onto
every instance that reads it, or fetched from where it lives each time it is shown
([record 68](0068-peers-talk-directly-over-https-with-a-websocket-channel-for-notifications.md)). The choice decides who
holds whose data.

## Decision

An instance does not keep content it loads from another instance. Posts, profiles and photos are fetched fresh whenever
the owner goes to them. The only things kept about a peer are what is needed to reach them safely, namely a label, their
key and its fingerprint, their address, the state of the connection and when things happened.

## Consequences

- Content stays with the person who shared it, and no instance piles up copies of anyone else's.
- When a peer is offline their content cannot be shown. The interface says so, and never presents an unreachable peer as
  a peer with nothing to show.
- No third instance or always-on server holds a copy, so each person's data stays under their own control.
- Content is fetched again on every view, which adds delay for the person viewing it and load on the instance that holds
  it.
- This is a commitment built into the code, not a setting an owner can change.
