# 103. Content is cleaned when it comes in and encoded when it is shown

Proposed.

## Context

An instance displays content written on instances it does not control
([record 65](0065-peers-talk-directly-over-https-with-a-websocket-channel-for-notifications.md)). Approving every peer
([record 2](0002-connections-are-mutual-and-nobody-follows-anyone.md)) keeps out anonymous attackers, and three risks
remain. A peer's instance may be compromised, a peer may run modified software, and a curious teenager may try a prank.
Content also arrives from outside sites, from files and imports, and from backups being restored.

## Decision

Content is cleaned of anything that could run as code, both when the instance's own users write it and when it arrives
from a peer or anywhere else, whatever the source's reputation, and before it is stored. It is cleaned again before it
leaves the backend, for the place it is going. It is then encoded for wherever it is shown, which is the main defence.
Cleaning plain text removes only what is invalid, such as broken encoding or control characters, and keeps everything a
person wrote.

## Consequences

- Encoding happens where content is shown, in the form that place needs. Text made safe for a web page is not assumed
  safe for an email header, a file name or a log.
- Hidden control characters, such as a line break inside a name, are refused outright wherever an email header is
  involved.
- Every feature that accepts content from peers follows this rule. Scalable Vector Graphics (SVG) images, which can
  carry scripts, are not accepted, and incoming tags are checked against a list of allowed characters.
- Content stored before a cleaning rule changed can be checked again against the current rules.
- None of this stops a peer from saying something hostile, which is a matter for the owner's own control, such as hiding
  or disconnecting, not of security.
- Storing content as received and cleaning it only on the way out was rejected, because every place that later read it
  would then have to clean its output, and one that forgot would expose everything stored.
