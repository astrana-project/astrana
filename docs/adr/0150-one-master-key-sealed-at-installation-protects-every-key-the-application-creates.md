# 150. One master key, sealed at installation, protects every key the application creates

Proposed.

## Context

The keys the running instance needs are kept under one master key sealed to the host machine
([record 149](0149-each-key-does-one-job-under-either-the-master-key-or-the-owners-recovery-words.md)). Sealing a key to
the machine's hardware at machine scope needs administrator rights, and sealing it through the service manager needs
root. Only the installer runs with those rights
([record 85](0085-astrana-owner-tools-does-what-needs-the-host-machine-and-the-applications-setup-does-the-rest.md)),
and the application itself never does.

## Decision

The installer creates the master key and seals it. The application creates every other key at first run, which includes
its transport keys, its data protection keys, the password pepper and the key that protects authenticator secrets, and
keeps each of them encrypted under the master key. The identity key is created at first run too, and sealed under the
owner's recovery words rather than the master key.

## Consequences

- Installation has one elevated step, and only one key has to be sealed again when an instance moves or is restored.
- Every key under the master key is as well protected as the sealing the hosting environment allows, and no better.
- The application can make new keys of its own, such as an hourly transport key, without asking for elevated rights.
- Losing the master key, as when the host machine fails, loses every key under it, which a restore brings back from a
  backup under a fresh master key sealed to the new machine.
- The installer creating each key itself was rejected, because every key would need its own elevated sealing, and
  sealing again on every move or restore.
