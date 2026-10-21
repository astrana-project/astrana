# 61. An instance may run on the owner's own hardware or on hosting they rent

Proposed.

## Context

Self-hosting usually means running software on your own hardware and using it yourself. Most people cannot set up and
look after a server, and many who could would rather not, while the owner still has to manage their own instance
([record 32](0032-every-instance-is-managed-by-its-owner-and-nobody-else-operates-it.md)).

## Decision

An instance may run on the owner's own hardware, such as a personal computer or a home server, or on hosting they rent,
such as a rented server, a cloud platform or shared web hosting. Wherever it runs, the owner manages it.

## Consequences

- Astrana runs anywhere that meets its requirements, because a tool for staying in touch with people is useful only if
  those people can run it.
- Shared hosting is included on purpose, because excluding it would exclude the people least able to do anything about
  it.
- For many owners a managed or shared hosting provider is the safer choice, kept up to date by people whose job it is.
- Spreading authority is not the same as spreading hosting. If most owners choose the same few providers, instances
  gather in a few places, and a provider is a party that can be compelled.
