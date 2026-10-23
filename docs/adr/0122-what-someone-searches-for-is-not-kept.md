# 122. What someone searches for is not kept

Proposed.

## Context

A record of what someone searched for says what they were looking for, when and how often
([record 103](0103-search-covers-one-instance-at-a-time.md)).

## Decision

Search queries are not retained. There is no search history, no list of recent searches, and no suggestions drawn from
past queries.

## Consequences

- A record of what someone looked for can never be read, inherited or handed over, because it does not exist.
- A peer receiving a search request sees it, and what they do with it is their own instance's business.
