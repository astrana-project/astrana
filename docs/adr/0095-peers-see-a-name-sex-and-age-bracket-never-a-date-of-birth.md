# 95. Peers see a name, sex and age bracket, never a date of birth

Proposed.

## Context

A peer who can see a profile ([record 54](0054-a-profile-is-seen-only-after-connecting.md)) needs to know who they are
talking to and how to address them. The instance needs a date of birth to tell whether its owner is a child.

## Decision

Every profile shows peers the person's name, sex and age bracket, and these cannot be hidden. The date of birth is kept
by the instance and is never shown to peers.

## Consequences

- A peer learns how to address someone and roughly how old they are.
- A child's exact birth date is never disclosed to everyone they connect with.
