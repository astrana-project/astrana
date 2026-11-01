# 157. A custodian signs an ending only through an ending-only key that opens on activation

Proposed.

## Context

After an owner's death, a custodian ([record 48](0048-there-are-four-kinds-of-account-and-no-others.md)) may need to
close the instance, and its peers should then receive an ending rather than silence
([record 156](0156-an-identity-is-retired-by-a-signed-ending-never-signed-in-advance-and-peers-are-told-neutrally.md)).
An ending is signed with the identity key, which opens only with the owner's recovery words, and a custodian's authority
is to preserve and recover, never to take over the identity
([record 87](0087-an-account-gets-only-what-its-role-needs-settled-in-advance.md)).

## Decision

The owner's instance holds an ending-only key, signed by the identity key, which can sign an ending and nothing else. It
is sealed under a key derived from the custodian's own secret, and opens only when the custodian's access activates,
with their secret, a second factor, the owner told on every channel, and a delay in which a living owner can cancel.

## Consequences

- A thief with the machine cannot use the key without the custodian's secret, and the key can never take over the
  identity.
- The custodian holding the key themselves was rejected. They would have to keep it safe for years, and a stolen copy
  could end the identity at any time without activation, which is closest to an ending signed in advance.
- Peers waiting before accepting a custodian's ending was rejected, because it would repeat the activation delay.
- Giving the custodian the recovery words was rejected, because they would be able to take over the identity.
- Having no signed ending after a death was rejected, because it would leave peers with silence rather than a notice.
- Where the owner's host machine is destroyed or lost, there is no instance to activate and no signed ending, and peers
  are left with silence.
