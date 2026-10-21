# 158. Types that cross an external boundary are named Inbound and Outbound

Proposed.

## Context

Only types shaped by an external contract cross an external boundary, and each adapter owns the types for its own
boundary ([record 157](0157-internal-and-external-boundaries-are-treated-differently.md)). A reader, and an automated
check, need to tell those types apart from the inside's own types at a glance.

## Decision

A type carrying data into the instance across an external boundary is named with the suffix `Inbound`, and one carrying
data out with the suffix `Outbound`. Each carries its own mapping to and from the use case's types.

## Consequences

- Which way a type crosses, and that it is shaped by someone else's contract, is visible from its name.
- Direction is always relative to the instance, so the names mean the same whatever the transport.
- The mapping sits with the type it maps, so a contract change touches one file.
- Request and Response were rejected because they describe one transport, the Hypertext Transfer Protocol (HTTP), and
  say nothing about which side of the boundary a type is on. Data transfer object was rejected because it names a
  mechanism rather than a role.
