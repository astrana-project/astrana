# 106. A second factor is required

Proposed.

## Context

People sign in to the instance itself ([record 72](0072-people-sign-in-to-the-instance-itself.md)). A second factor can
lock someone out, and an owner has no support desk to call. Recovery codes that the owner keeps, and a documented
command on the host machine that clears a second factor, give a way back in that depends on nobody else.

## Decision

Owners, and parents or guardians, must set up a second factor before an instance's setup is finished. Guests must use
one whenever they sign in with a password.

## Consequences

- Recovery codes are issued when the second factor is set up, to be kept safely with the instance's other recovery
  details.
- Before setup finishes, the owner is told plainly that there is no support desk, and that the recovery codes and the
  command on the host machine are the only ways back in.
- The command on the host machine is the only way to clear a second factor, and it needs access to the host machine. A
  password reset does not skip it.
- Leaving the second factor optional was rejected, because the recovery codes and the command on the host machine answer
  the risk of lockout.
