# 103. Search covers one instance at a time

Proposed.

## Context

People want to find things they or their peers shared. A search could run across a gathered copy of everyone's content,
or ask one instance at a time ([record 49](0049-a-request-to-a-peer-is-a-request-never-a-demand.md)).

## Decision

A search runs against one instance's content, the owner's own or a peer's, as a request to that instance. There is no
index spanning the network.

## Consequences

- Nobody can search Astrana as a whole, so search is never a way to find strangers.
- What a search of a peer can reach is what that peer would show anyway.
- A person who remembers a conversation but not whose instance it was on has to look instance by instance.
