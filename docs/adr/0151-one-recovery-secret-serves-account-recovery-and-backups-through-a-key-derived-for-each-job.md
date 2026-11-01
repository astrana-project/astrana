# 151. One recovery secret serves account recovery and backups, through a key derived for each job

Proposed.

## Context

An owner needs a way back into their instance and a way to read their backups, and both have to rest on something the
owner holds away from the instance, because a key kept only on the instance is lost with it. The keys only the owner
should use are kept under that secret
([record 149](0149-each-key-does-one-job-under-either-the-master-key-or-the-owners-recovery-words.md)). A secret that
opens either one already amounts to full compromise. A backup carries the instance's keys, so whoever can read every
backup can stand up a copy that answers as the instance, and whoever can recover the owner account takes over the live
instance.

## Decision

The owner keeps one recovery secret, a list of recovery words kept on paper or in a password manager, and it serves both
account recovery and backups. Each key the secret serves is derived from it in one standard step, one for each job, such
as sealing the identity key and sealing backups, and each can be rotated on its own. The owner may keep one extra copy
of the words in a password manager, and is asked from time to time to show they still have them.

## Consequences

- Two secrets would add little protection, since either is enough to take everything, and would double the chance of
  losing something essential. A mechanism people use correctly protects better than a stricter one they misuse.
- Losing the words loses every backup and owner account recovery through them, together with every use of the identity
  key. The instance keeps running, and the owner is told plainly at setup that this is the stake.
- A custodian can be released the key for one job, such as reading backups, without receiving the words or the means to
  take over the live instance.
- The recovery codes issued with the second factor stand beside the secret as an earlier and separate layer
  ([record 126](0126-a-second-factor-is-required.md)).
- Checking a backup proves the owner still has the words, which answers the periodic question as well.
- Changing the secret means sealing the backups again and rotating every key derived from it.
- Splitting the words among trusted people would guard better against losing them, and was rejected as more to build and
  to explain.
- Holding the master key
  ([record 150](0150-one-master-key-sealed-at-installation-protects-every-key-the-application-creates.md)) gives no
  access to anything the recovery words protect.
