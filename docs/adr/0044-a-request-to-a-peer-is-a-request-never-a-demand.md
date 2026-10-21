# 44. A request to a peer is a request, never a demand

Proposed.

## Context

Peers ask each other for content, searches and more
([record 2](0002-connections-are-mutual-and-nobody-follows-anyone.md)).

## Decision

When one instance asks another for something, the instance holding it decides what it is willing and able to return. It
may return less, or nothing, for any reason or none, and need not explain.

## Consequences

- A cautious peer that serves nothing is behaving correctly.
