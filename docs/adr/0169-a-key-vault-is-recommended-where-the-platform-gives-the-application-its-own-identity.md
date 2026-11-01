# 169. A key vault is recommended where the platform gives the application its own identity

Proposed.

## Context

An instance holds secrets outside its database, the pepper on every password hash among them
([Every password hash uses a pepper](0166-every-password-hash-uses-a-pepper-held-outside-the-database.md)). The hosting
environment decides how well they can be protected
([record 136](0136-the-hosting-environment-must-protect-data-and-receive-security-fixes-however-it-does-so.md)). A key
vault keeps secrets off the machine, but the instance then needs a credential to reach the vault, and only the large
clouds' own compute gives an application an identity of its own with no stored credential.

## Decision

A key vault is recommended where the platform gives the application an identity of its own, so that no vault credential
sits on the host machine. Elsewhere it is offered with an honest explanation. It is never required. An instance that
uses a vault and cannot reach it waits a bounded time, then refuses to start, with a clear message to the owner. Nothing
secret is cached on the machine.

## Consequences

- Where a credential has to be stored locally, a vault still adds logging and revocation, and keeps secrets out of disk
  backups.
- A self-hosted vault moves the credential rather than removing it, and starts sealed after every restart, where
  unsealing it automatically needs a stored credential again.
- The protection level is reported to the owner in the same way as the other levels
  ([record 135](0135-what-an-instance-finds-about-its-hosting-environment-is-told-to-its-owner-and-nobody-else.md)).
- An outage of the vault stops the instance, which follows the rule of holding back rather than going ahead
  ([record 14](0014-when-a-protection-cannot-be-applied-the-instance-holds-back-rather-than-going-ahead.md)).
- A sealed local cache of the vault's secrets was rejected, because it would need a key held on the machine, which
  undoes the point of the vault.
