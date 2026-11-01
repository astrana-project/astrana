# 201. An instance does not tell its peers it has been restored

Proposed.

## Context

Telling peers about what an instance does reveals things about its owner, and peers already learn what they need by
asking ([record 51](0051-a-request-to-a-peer-is-a-request-never-a-demand.md),
[record 65](0065-a-former-peer-learns-of-a-disconnection-when-they-next-ask.md)). A restore invites an exception, so
that peers could resend what was lost.

## Decision

A restore sends nothing to peers. They learn what they need when they next ask, and the restored instance decides what
to return.

## Consequences

- Nothing Astrana sends tells a peer that an instance was restored.
- What peers wrote on the instance after the archive was made is lost, and no other copy exists, because an author's own
  instance keeps none of what it posted elsewhere. The owner is shown that loss before confirming
  ([record 198](0198-a-restore-shows-what-it-will-lose-before-the-owner-confirms.md)).
- Someone who comments during a restore sees the send fail at that moment and can try again.
- Any check against copies of an instance has to be one peers cannot read, so a counter signed by the identity key and
  raised on each restore was rejected, because peers would see it change.
- Telling peers so that they could resend was rejected, because they hold nothing to resend.
