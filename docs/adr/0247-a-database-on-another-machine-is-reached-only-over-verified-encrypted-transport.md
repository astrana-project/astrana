# 247. A database on another machine is reached only over verified encrypted transport

Proposed.

## Context

The hosting environment must encrypt data in transit
([record 136](0136-the-hosting-environment-must-protect-data-and-receive-security-fixes-however-it-does-so.md)). A
database on another machine is reached across a network, where anyone in the path could read or change what passes. The
supported databases offer encryption that does not always check whose certificate it accepts, and in testing one
engine's required mode accepted a swapped certificate and another's automatic encryption accepted a certificate from the
wrong authority. A compromised instance harms its peers as well as its owner, and encrypting the connection costs
little.

## Decision

A database on another machine is reached only over encrypted transport whose certificate is verified. Where the
certificate cannot be verified against a trusted authority, Astrana Owner Tools shows its fingerprint, the owner
confirms it, and the instance then accepts only that certificate. Where no encrypted transport is offered, the
installation is refused. A database on the host machine that cannot be reached from outside it uses encrypted transport
where it can, and does not require it. Astrana Owner Tools verifies that such a database listens only locally, and the
instance checks it again regularly.

## Consequences

- Only full verification or a pinned certificate counts as encrypted transport, because the engines' weaker modes let a
  swapped certificate through.
- Certificate checks are never quietly turned off.
- A pinned certificate that changes stops the connection and alerts the owner, so a legitimate renewal needs the owner
  to confirm the new one.
- A hosting provider whose remote database offers no encryption cannot carry an instance.
- Accepting an unverified certificate with a warning was rejected, because anyone in the path could then present their
  own certificate and read or change everything that passes.
