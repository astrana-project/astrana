# 119. The hosting environment must protect data and receive security fixes, however it does so

Proposed.

## Context

Instances run on very different machines, from a laptop to shared web hosting
([record 64](0064-an-instance-may-run-on-the-owners-own-hardware-or-on-hosting-they-rent.md)), and each protects data in
its own way.

## Decision

The machine an instance runs on must be able to encrypt data at rest and in transit, and must have a way to receive
security fixes. How it does each is up to the platform.

## Consequences

- On a personal computer the operating system's own encryption and secrets store are usually enough. On shared hosting
  that offers one, a key management service does the same job.
- An environment that falls short, such as shared hosting with no key management service or a disk whose encryption
  cannot be verified, is reported to the owner and the instance keeps running
  ([record 118](0118-what-an-instance-finds-about-its-hosting-environment-is-told-to-its-owner-and-nobody-else.md)).
- Encryption in transit to a database on another machine is the exception, and an installation without it is refused. A
  database on the same machine that cannot be reached from outside it uses encrypted transport where it can, and does
  not need it.
- An instance cannot claim more protection than its hosting environment provides, so what it reports depends on where it
  runs. On shared hosting most of the protection is the hosting provider's rather than Astrana's.
