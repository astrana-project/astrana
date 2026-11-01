# 153. An identity key is replaced by a signed rollover, with an overlap

Proposed.

## Context

Every peer has pinned an instance's identity key
([record 38](0038-peers-recognise-each-other-by-keys-remembered-when-they-first-connect.md)), and an identity key may
still have to be replaced, such as to move to a signature algorithm that is safe against a quantum computer. A peer
shown a new key with nothing to vouch for it has to treat the change as suspect, and its owner has to compare the short
code again ([record 69](0069-two-people-confirm-a-short-code-before-their-instances-connect.md)).

## Decision

The old identity key signs a statement naming the new one. For an overlap, both keys sign, so peers that were offline
can catch up, and then the old key retires. A peer accepts a properly signed rollover and tells its person. A change of
identity key that the old key did not sign gets the changed-key warning and is never accepted silently.

## Consequences

- An owner can replace their identity key without comparing a code again with every peer.
- A rollover uses the identity key, so it needs the owner's recovery words
  ([record 151](0151-one-recovery-secret-serves-account-recovery-and-backups-through-a-key-derived-for-each-job.md)).
- It is the route to a post-quantum identity key, without a single day on which every instance has to change at once.
- An owner who has lost their identity key or their recovery words cannot roll over, and starts again with a new
  identity that each peer has to confirm.
