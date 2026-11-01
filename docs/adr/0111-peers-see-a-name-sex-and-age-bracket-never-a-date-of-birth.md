# 111. Peers see a name, sex and age bracket, never a date of birth

Proposed.

## Context

A peer who can see a profile ([record 60](0060-a-profile-is-seen-only-after-connecting.md)) needs to know who they are
talking to and how to address them. The instance needs a date of birth to tell whether its owner is a child.

## Decision

Every profile shows peers the person's name, sex and age bracket, and these cannot be hidden. The date of birth is kept
by the instance and is never shown to peers.

## Consequences

- A peer learns how to address someone and roughly how old they are.
- A child's exact birth date is never disclosed to any peer.
- Someone who does not want to disclose their sex, or whose sex a single field does not describe, cannot leave it out.
- The age bracket tells every peer when an owner is a child.
- The bracket informs the people who see it. An instance sharing content never acts on a peer's bracket, and protections
  for a child who views content are applied by the child's own instance, from the date of birth it already holds.
