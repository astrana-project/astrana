# 99. A reshare carries only a count of how many times it has been passed on

Proposed.

## Context

A reshare is a new act of publication
([record 98](0098-resharing-something-publishes-it-anew-to-the-resharers-own-audience.md)). A person seeing one may want
to know how far it has travelled. The path it took would also say who passed it on, to people who may not know them.

## Decision

A reshare carries a count of how many times it has been passed on, and nothing else about where it has been.

## Consequences

- The count shows distance, not the path, so nobody learns who passed something on beyond the person who shared it with
  them.
- Modified software can forge the count, so it is a hint, not a fact.
- Carrying the full path was rejected, because it would reveal people to others who are not connected to them. Carrying
  nothing was rejected, because how far something has travelled helps a person judge it.
