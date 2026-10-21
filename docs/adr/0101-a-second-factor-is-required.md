# 101. A second factor is required

Proposed.

## Context

People sign in to the instance itself ([record 68](0068-people-sign-in-to-the-instance-itself.md)). A second factor can
lock someone out, and an owner has no support desk to call, which is why it was first made optional. Recovery codes that
the owner keeps, and a documented command on the host machine that clears a second factor, give a way back in that
depends on nobody else.

## Decision

Owners, and parents or guardians, must set up a second factor before an instance's setup is finished. Guests must use
one whenever they sign in with a password.

## Consequences

- Recovery codes are issued when the second factor is set up, to be kept safely with the instance's other recovery
  details.
- Before setup finishes, the owner is told plainly that there is no support desk, and that the recovery codes and the
  command on the host machine are the only ways back in.
- No emergency route skips the second factor, not even a password reset.
- An instance that is already running is given a long warning period, and is then blocked until a second factor is set
  up.
- Leaving the second factor optional was rejected, because the recovery codes and the host command answer the risk of
  lockout that made it optional.
