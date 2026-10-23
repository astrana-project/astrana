# 49. A request to a peer is a request, never a demand

Proposed.

## Context

Peers ask each other for content, searches and more
([record 2](0002-connections-are-mutual-and-nobody-follows-anyone.md)). A requester cannot compel a peer, peers run
different versions with different settings, and an owner may want to withhold something without explaining why.

## Decision

When one instance asks another for something, the instance holding it decides what it is willing and able to return. It
may return less, or nothing, for any reason or none, and need not explain.

## Consequences

- A cautious peer that serves nothing is behaving correctly.
- A requester can never tell a complete answer from a partial one, so nothing may assume that an answer is complete.
