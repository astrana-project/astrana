# 110. A second factor is required

Proposed.

## Context

People sign in to the instance itself ([record 75](0075-people-sign-in-to-the-instance-itself.md)). A second factor can
lock someone out, and an owner has no support desk to call. A way back in has to exist for every account, and it has to
depend on nobody outside the instance.

## Decision

Owners, and parents or guardians, must set up a second factor before an instance's setup is finished. Guests must use
one whenever they sign in with a password. Recovery has layers. Every account starts with its own recovery codes. After
them, the owner falls back on the recovery secret, the word list the owner keeps for account recovery and backups, and
then on owner account recovery through a tool on the host machine, which works only after a waiting period. Every other
account falls back on a reset by the owner, a guardian or a custodian.

## Consequences

- Recovery codes are issued when the second factor is set up. They neither replace the recovery secret nor derive from
  it, and each layer works without the ones before it.
- Every kind of account recovers the same way first, with its own codes. A guest has no access to the host machine, so
  what follows the codes for a guest is a reset by someone else.
- Before setup finishes, the owner is told plainly that there is no support desk, and that the recovery codes, the
  recovery secret and owner account recovery on the host machine are the only ways back into the owner account.
- A password reset never skips the second factor.
- Folding the recovery codes into the recovery secret was rejected. A recovery code is typed on whatever device is to
  hand at the moment of lockout, into a page that could be phished, while one exposure of the recovery secret makes every
  past backup readable and lets the instance's identity be taken. Codes are also cheap to replace as a set, and the
  secret is not.
- Leaving the second factor optional was rejected, because the layers of recovery answer the risk of lockout.
