# 156. An identity is retired by a signed ending, never signed in advance, and peers are told neutrally

Proposed.

## Context

An owner who closes their instance wants the people they are connected to to know, and the identity must not come back
later as a copy restored from a backup. Ending a connection sends nothing
([record 65](0065-a-former-peer-learns-of-a-disconnection-when-they-next-ask.md)), but an instance that has been closed
will never answer again. Whoever could send an ending could end someone's identity for good.

## Decision

When an owner closes their instance, Astrana Owner Tools asks for the recovery words, signs an ending with the identity
key, and sends it to every peer before destroying anything. Peers keep the retirement permanently and refuse the key
afterwards. No ending is ever signed in advance. A peer's person sees a neutral notice that never gives a reason, such
as "Your connection with Alex has ended. Their instance has been closed."

## Consequences

- Malware, or anyone else with administrator access to the host machine, cannot forge an ending, because the identity
  key needs the recovery words, and cannot find one stored, because none is made in advance. Only an owner closing the
  instance interactively can tell peers.
- Retirement cannot be undone. An owner who comes back needs a new identity and has to connect to each peer again.
- Astrana Owner Tools retries, and shows which peers acknowledged. If the machine stays, a retry service may carry on
  for about a week, holding only the signed endings for peers it has not reached, which contain no secrets and do
  nothing if replayed. Its list is encrypted and deleted at the end, and it leaves a final report.
- A peer that never received the ending would still accept a restored copy, and there is no central list of retired
  identities to fall back on.
- An owner who has lost their recovery words cannot sign an ending, so their peers are left with only the silence of an
  instance that has stopped answering.
- The notice arrives as an ordinary notification, under the person's own settings. The ended person's posts and photos
  disappear, because they lived on their instance. Their comments on the person's own content stay, marked as from an
  ended connection, and may be deleted like anything else there.
- The connection moves to an ended state rather than vanishing, because the instance has to remember the retired key to
  refuse it.
- A guardian's overview shows that a child's connection ended, as metadata only, and the child sees the same notice as
  anyone else.
- The passive wording stays true whoever closed the instance, including a custodian after a death. Wording about leaving
  Astrana was rejected, because there is no platform to leave.
