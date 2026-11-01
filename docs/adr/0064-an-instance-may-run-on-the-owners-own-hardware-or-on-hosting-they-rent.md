# 64. An instance may run on the owner's own hardware or on hosting they rent

Proposed.

## Context

Self-hosting usually means running software on your own hardware and using it yourself. Most people cannot set up and
look after a server, and many who could would rather not, while the owner still has to manage their own instance
([record 35](0035-every-instance-is-managed-by-its-owner-and-nobody-else-operates-it.md)).

## Decision

An instance may run on the owner's own hardware, such as a personal computer or a home server, or on hosting they rent,
such as a rented server, a cloud platform or shared web hosting. Wherever it runs, the owner manages it. Shared hosting
is supported only where the hosting provider allows the database accounts to be separated as Astrana needs, which is
checked before anything is installed.

## Consequences

- Astrana aims to run wherever its owners can run it, because a tool for staying in touch with people is useful only if
  those people can run it.
- Shared hosting is supported for two reasons. Excluding it would exclude the people least able to do anything about it.
  And some people will try to run Astrana there anyway, possibly less securely than they could, so a secure option
  ready to use reduces harm.
- A shared hosting plan that grants a database user all privileges or none cannot carry an instance at all, because the
  separation of database accounts is never weakened for any hosting provider. That may rule out the most common kind of
  shared hosting.
- A private virtual server is encouraged over shared hosting, because it gives the owner administrator rights, the
  operating system's secrets store and disk encryption they control.
- Managed hosting is not often the safer choice, but it can be, where the hosting provider is trustworthy and competent
  and keeps the system patched.
- Spreading authority is not the same as spreading hosting. If most owners choose the same few providers, instances
  gather in a few places, and a provider is a party that can be compelled.
