# 74. Email is sent through small, replaceable modules, and never directly from the instance

Proposed.

## Context

Email carries notices and sign-in links, and is never the only channel for a security notice. Mail sent straight from a
home or rented server is often treated as spam, and residential connections often block the port it needs. There are
far too many delivery services for Astrana to connect to each one itself.

## Decision

Email is optional. When it is used, it is sent through a module, a small library that connects Astrana to one way of
sending mail, and never directly from the instance to the recipient's mail server. The main route is the owner's own
email account, signed in to with an application password where the provider allows one. On shared hosting the hosting
provider's mail server is used. An owner with a domain may use a transactional email provider through its module.

Astrana ships a module for ordinary mail servers using the Simple Mail Transfer Protocol (SMTP), and at least one module
for a transactional provider from the start. A kit lets anyone write a module for any provider's public interface.

## Consequences

- An owner can choose a provider that suits them, including one in their own country, because a module can be written by
  anyone and not only by the provider.
- Keeping each module tiny is a security measure, because a small module is one a person can actually review.
- A module sees everything it sends, including sign-in links, so an owner's choice of module is a security decision.
- Signing in to a large email provider through its own authorisation service is an advanced option only. The owner uses
  a registration of their own with that provider, guided by Astrana Owner Tools, signs in on their own computer, and the
  grant is carried to the instance sealed.
- The project holds no registration with any email provider on behalf of owners. It would make Astrana a party to every
  owner's mailbox access, which is the central dependency [record 35](0035-every-instance-is-managed-by-its-owner-and-nobody-else-operates-it.md)
  refuses, and one large provider requires a yearly independent assessment the project cannot pay for.
- Sending directly from the instance was rejected, because residential ports are blocked and such mail lands on
  blocklists and in spam folders.
