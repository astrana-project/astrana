# 94. A refusal looks the same as finding nothing

Proposed.

## Context

A peer may decline a request ([record 49](0049-a-request-to-a-peer-is-a-request-never-a-demand.md)), and telling the
requester so would itself say something. An owner is told whether a source could be reached
([record 15](0015-empty-unmet-and-failed-are-shown-as-three-different-states.md)), so they do not wait for posts that
will never come.

## Decision

To the instance asking, a refusal looks the same as a request that matched nothing. Declining is a choice, and is not
shown. An instance that could not be reached is a failure, and is shown as one.

## Consequences

- Declining never discloses a private choice, or tells someone they were singled out. Content withheld from an audience,
  a throttled request and a peer that has switched off a feature all look like an ordinary answer.
- A short answer from a peer can also mean expired content or a fault on the peer's side, so the asking instance never
  presents a peer's answer as everything that exists.
- An owner looking at their own instance is always told which it was.
- A former peer is the exception, and is told the connection has ended
  ([record 63](0063-a-former-peer-learns-of-a-disconnection-when-they-next-ask.md)).
- Making a refusal look the same as not being reached was rejected, because the owner could not then tell a peer whose
  machine is off from one with nothing new.
