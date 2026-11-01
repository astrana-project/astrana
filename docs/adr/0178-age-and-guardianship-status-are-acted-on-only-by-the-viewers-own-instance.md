# 178. Age and guardianship status are acted on only by the viewer's own instance

Proposed.

## Context

Every peer sees an owner's age bracket
([record 111](0111-peers-see-a-name-sex-and-age-bracket-never-a-date-of-birth.md)) and whether their instance is under
guardianship or custodianship
([record 100](0100-an-instance-tells-its-peers-whether-it-is-under-guardianship-or-custodianship.md)). A sharing
instance could use either to decide what to send, but it cannot see which accounts sit behind a peer
([record 177](0177-each-instance-enforces-only-what-it-serves.md)).

## Decision

A sharing instance never uses a peer owner's age bracket or guardianship status for anything. Protections for children
run entirely on the viewer's own instance, from the date of birth it already holds.

## Consequences

- No instance acts on another person's age, which is a stronger position than using a shared bracket carefully.
- No age needs to pass between instances for a child to be protected, because the child's own instance knows the child's
  age.
- A sharer cannot tailor what it sends to a child, and relies on the child's instance to apply the child's protections.
- The bracket and the guardianship status still inform the people who see them.
