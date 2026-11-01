# 158. When two copies of an instance both seem current, both sides hold, and neither stands down by itself

Proposed.

## Context

Two copies of one identity can both be running, as when someone has stolen a copy, or when a restore went ahead while
the original was still up ([record 20](0020-each-person-is-represented-by-one-instance.md)). Each copy then presents
current transport keys of its own
([record 152](0152-the-ed25519-identity-key-signs-a-revocable-rotation-key-which-signs-hourly-x25519-transport-keys.md)),
and the peers that talk to both can see it.

## Decision

An instance that learns through its peers that another copy of itself is current holds, stopping its exchanges with
peers and telling its owner on every channel, and never stands down permanently by itself. A peer that sees two
different current transport keys for one identity also holds, tells its own person neutrally that the connection is
paused because something looks wrong on the other side, and resumes when the conflict clears. Each copy keeps a sealed
restore marker that peers cannot read, so two running copies can work out which is current from what peers send back.

## Consequences

- Holding is what an instance does when a protection cannot be applied
  ([record 14](0014-when-a-protection-cannot-be-applied-the-instance-holds-back-rather-than-going-ahead.md)). The pause
  is not a judgement of the peer
  ([record 61](0061-signals-about-a-peer-inform-the-owner-and-never-act-by-themselves.md)), and it ends by itself when
  only one copy remains.
- An automatic stand-down was rejected because it could be exploited. In testing, a stolen copy made the honest original
  stand down everywhere after talking to a single peer.
- The signal is two current transport keys, not one key seen at two addresses, which fires on every ordinary change of
  address. Given a grace period as long as the longest delay in connecting, it raised no false alarms for moves of
  address, outages, peers offline for months or clocks that were wrong.
- Which copy carries on is for the owner to decide, and nothing decides it for them.
