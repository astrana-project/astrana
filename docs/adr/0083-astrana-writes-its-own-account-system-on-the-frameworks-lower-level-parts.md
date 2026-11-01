# 83. Astrana writes its own account system on the framework's lower-level parts

Proposed.

## Context

Every account signs in to the instance itself ([record 82](0082-people-sign-in-to-the-instance-itself.md)), and there
are four kinds of account with different jobs ([record 48](0048-there-are-four-kinds-of-account-and-no-others.md)).
ASP.NET Core ships an identity system with its own accounts, sign-in manager and database schema. It is a good baseline
for an application with nothing, but it is prescriptive, needs a fair amount of overriding to fit roles like these, and
brings functionality Astrana does not need.

## Decision

Astrana writes its own account types, roles, recovery and resets for the owner, guardian, guest and custodian accounts.
It builds them on the parts of the framework that fit, which are cookie authentication with the server owning the
session, authorisation policies, the data protection stack and constant-time comparison. The framework's sign-in manager
and database schema are not used as the account model. Its user manager is used only for passkeys, because the
framework's passkey handler works through it, with Astrana's account store behind an adapter.

## Consequences

- Functionality that is shipped and never used still counts as attack surface and as something to keep current, which is
  how the rule on outside components applies to a framework
  ([record 4](0004-astrana-depends-on-outside-components-only-where-it-must.md)).
- The account model matches the four kinds of account exactly, with no general roles or tables to keep switched off.
- Astrana carries the cost of writing, testing and maintaining its own account code, recovery and resets included.
- Using the framework's identity system as the account model was rejected, because it would be overridden more than it
  was used.
