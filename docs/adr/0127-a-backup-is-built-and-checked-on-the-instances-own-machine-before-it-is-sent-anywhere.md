# 127. A backup is built and checked on the instance's own machine before it is sent anywhere

Proposed.

## Context

A backup may be kept elsewhere ([record 126](0126-an-instance-backs-itself-up-into-an-encrypted-archive.md)), and a
transfer that fails part way leaves something that looks like a backup and is not.

## Decision

A backup is always created on the instance's own machine and checked to be complete before it is sent to where it will
be kept. It is never written directly to a remote destination.

## Consequences

- A half-written archive is never mistaken for a backup.
