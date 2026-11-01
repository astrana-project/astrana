# 166. Every password hash uses a pepper held outside the database

Proposed.

## Context

Passwords are hashed with Argon2id
([Passwords are hashed with Argon2id](0084-passwords-are-hashed-with-argon2id-tuned-to-each-host-machine-with-a-cap-on-how-many-run-at-once.md)).
A stolen database, or a stolen database backup, would still let an attacker try to crack those hashes offline. Keys that
do different jobs are held apart
([record 149](0149-each-key-does-one-job-under-either-the-master-key-or-the-owners-recovery-words.md)).

## Decision

Every password hash uses a pepper, a secret key given to Argon2id as its own secret input. It is always on and is never
stored in the database. Where a key vault is used the pepper lives in the vault, and otherwise it is sealed under the
instance's master key. Backups carry it.

## Consequences

- A stolen database or database backup alone is not enough to crack passwords offline, because the attacker also needs a
  key held outside the database.
- The cost is microseconds on any host machine, so every instance can use one. What varies is how well its key is
  protected, from hardware through operating-system sealing to a passphrase or a file, and that level is reported to the
  owner.
- The recovery secret restores the pepper with a backup. An optional extra copy is shown once at setup for the owner's
  password manager, and is never the only copy.
- A lost pepper is recoverable, if inconveniently, through the layers of recovery and password resets
  ([record 126](0126-a-second-factor-is-required.md)).
- A changed pepper takes effect at each person's next sign-in, because rehashing needs their password, and old peppers
  are kept until no hash names them.
- Applying the pepper as a separate step before or after hashing was rejected. It cost the same, but only the
  algorithm's own input is described exactly by the settings stored with each hash.
- An optional pepper was rejected, because no host machine is too weak to compute one.
