# 164. The owner, a guardian or a custodian may reset another person's lockout

Proposed.

## Context

After recovery codes, every account other than the owner's falls back on a reset by someone else
([record 126](0126-a-second-factor-is-required.md)). A child owns some instances, and several guardians may hold equal
authority over them ([record 89](0089-several-guardians-may-hold-equal-authority.md)). A child must not be able to take
over or remove a guardian ([record 91](0091-a-child-cannot-remove-their-guardian.md)).

## Decision

The owner, a guardian or a custodian may reset the lockout of another account on the instance. A guardian may reset a
child owner's lockout. A child owner may start a reset for a guardian, and the code goes only to that guardian's own
email and is never shown to the child. Every guardian is told.

## Consequences

- A child who has locked themselves out gets back in through a guardian, and a guardian locked out on a child's instance
  is not stranded either.
- Starting a reset without ever receiving the code is what lets a child help a guardian without being able to take over
  the guardian's account.
- A guardian with no working email falls back on their own recovery codes or a reset by another guardian, because a
  child cannot start a reset that would need email.
- The owner account of an adult is never reset by another account, and recovers through its own layers.
- Every reset is a material action and is recorded in the audit log
  ([record 9](0009-every-material-action-is-logged-and-the-log-never-copies-content.md)).
