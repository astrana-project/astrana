# 70. Email is sent through small, replaceable modules

Proposed.

## Context

Email carries two-factor authentication codes and the links guests use to sign in, and neither has another way to
arrive. Email delivery services are more reliable than the alternatives, and there are far too many for Astrana to
connect to each one itself.

## Decision

Email is sent through a module, a small library that connects Astrana to one way of sending mail. Astrana ships one
module, for ordinary mail servers using the Simple Mail Transfer Protocol (SMTP), and maintains only that one. A kit
lets anyone write a module for any provider's public interface.

## Consequences

- An owner can choose a provider that suits them, including one in their own country, because a module can be written by
  anyone and not only by the provider.
- Keeping each module tiny is a security measure, because a small module is one a person can actually review.
- The kit's own documentation is not yet written.
