# 104. A refusal looks the same as finding nothing

Proposed.

## Context

A peer may decline a request ([record 51](0051-a-request-to-a-peer-is-a-request-never-a-demand.md)), and telling the
requester so would itself say something. An owner is told whether a source could be reached
([record 15](0015-empty-unmet-and-failed-are-shown-as-three-different-states.md)), so they do not wait for posts that
will never come.

## Decision

To the instance asking, a refusal looks the same as a request that matched nothing. A post, album or media item that was
deleted, has expired or was never for the asker gets one "not available" reply, the same in every case. Declining is a
choice, and is not shown. An instance that could not be reached is a failure, and is shown as one.

## Consequences

- Declining never discloses a private choice, or tells someone they were singled out. Content withheld from an audience,
  a peer that has switched off a feature and a peer whose requests are being limited all get an ordinary answer.
- A peer cannot learn that something existed and was removed, or that it was left out of an audience, because the sharer
  never chose to tell it either.
- Each item carries a random marker that changes when it is edited, changes audience or expires, so an instance can tell
  whether what it already holds is still current without being told why it is not.
- The instance's rate limiting answers the owner, guests and apps with the Hypertext Transfer Protocol (HTTP) status
  `HTTP 429 - Too Many Requests`, but a peer that is limited gets an ordinary answer, because telling it so would say
  something about how it was treated.
- A short answer from a peer can also mean a fault on the peer's side, so the asking instance never presents a peer's
  answer as everything that exists.
- An owner looking at their own instance is always told which it was.
- A former peer is the exception, and is told the connection has ended
  ([record 65](0065-a-former-peer-learns-of-a-disconnection-when-they-next-ask.md)).
- Making a refusal look the same as not being reached was rejected, because the owner could not then tell a peer whose
  machine is off from one with nothing new.
