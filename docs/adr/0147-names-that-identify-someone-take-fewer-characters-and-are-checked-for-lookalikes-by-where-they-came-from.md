# 147. Names that identify someone take fewer characters, and are checked for lookalikes by where they came from

Proposed.

## Context

A post is read, and a name is trusted. A name that reads as somebody else's is an attack on a person, and some
characters allowed in posts
([record 146](0146-text-may-not-hold-the-null-character-or-other-characters-that-have-no-place-in-writing.md)) can make
one name pass for another. Names also come from different places. A username is chosen on the instance that holds it
([record 26](0026-usernames-are-unique-only-within-an-instance.md)), and an instance name arrives from an instance
nobody here controls.

## Decision

Usernames, display names, instance names and relationship labels take no directional controls, and no zero-width
characters except a joiner or non-joiner where a language needs one, following the General Security Profile for
identifiers in Unicode Technical Standard (UTS) #39. Names that look alike are found with that standard's confusable
comparison, and what follows depends on where the name came from. A username that looks like an existing one on the
instance is refused. A display name is never refused for looking like another. An instance name that looks like the name
of a peer already connected is pointed out to the owner when they approve the connection. A relationship label is the
owner's own wording and is not checked.

## Consequences

- Refusing a lookalike username costs someone a second choice at the moment they are choosing, which is nothing.
- Two people in one household can share a name, so refusing lookalike display names would stop something real to prevent
  nothing.
- No instance can enforce uniqueness across a network it does not control, so a peer's instance name can only be warned
  about. The warning is a prompt to verify, not a protection. What protects a connection is the key remembered when it
  was made ([record 38](0038-peers-recognise-each-other-by-keys-remembered-when-they-first-connect.md)) and the code two
  people confirm ([record 69](0069-two-people-confirm-a-short-code-before-their-instances-connect.md)).
- A lookalike in a relationship label misleads only the person who wrote it.
- Reading one rule as covering every name was rejected, because it would either refuse legitimate peers whose names
  resemble others or present an advisory warning as if it were a protection.
