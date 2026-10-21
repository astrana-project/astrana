# 110. The host must protect data and receive security fixes, however it does so

Proposed.

## Context

Instances run on very different machines, from a laptop to shared web hosting
([record 59](0059-an-instance-may-run-on-the-owners-own-hardware-or-on-hosting-they-rent.md)), and each protects data in
its own way.

## Decision

The machine an instance runs on must be able to encrypt data at rest and in transit, and must have a way to receive
security fixes. How it does each is up to the platform.

## Consequences

- On a personal computer the operating system's own encryption and secrets store are usually enough. On shared hosting a
  key management service does the same job.
- An instance cannot claim more protection than its host provides, so what it reports depends on where it runs.
