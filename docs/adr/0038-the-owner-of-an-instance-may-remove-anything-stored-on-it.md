# 38. The owner of an instance may remove anything stored on it

Proposed.

## Context

Content belongs to its creator ([record 5](0005-content-belongs-to-the-person-who-created-it.md)), but it is stored
somewhere. A peer's comment on an owner's post, or a post on an owner's profile, sits on the owner's instance
([record 1](0001-each-instance-has-one-owner-who-is-its-sole-administrator.md)).

## Decision

Whoever owns the instance where content is stored may delete or hide it, even content someone else wrote. Storing
content gives no rights in it beyond that.

## Consequences

- An owner never has to be associated with content they do not want on their own instance.
- An owner may remove a peer's photograph from their instance, but holding it gives them no right to reuse or reshare
  it.
- One thing on an instance is not its owner's to delete. A report about their content stays for a fixed period whatever
  they prefer.
- An author's own instance keeps no copy of what they posted on someone else's, so a person who wants a record of what
  they said elsewhere has to keep it themselves.
