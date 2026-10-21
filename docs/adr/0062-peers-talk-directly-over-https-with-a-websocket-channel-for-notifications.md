# 62. Peers talk directly over HTTPS, with a WebSocket channel for notifications

Proposed.

## Context

Peers that have approved each other ([record 2](0002-connections-are-mutual-and-nobody-follows-anyone.md)) and can
recognise each other ([record 61](0061-peers-authenticate-each-other-with-a-noise-handshake-inside-https.md)) still need
a way to exchange requests.

## Decision

Each instance is reachable over Hypertext Transfer Protocol Secure (HTTPS), through the web server in front of it, and
peers send requests straight to each other, much as one server talks to another. A lightweight WebSocket channel carries
notifications.

## Consequences

- An instance on cloud or web hosting can be reached directly, and a home server can reach the same position with port
  forwarding and dynamic Domain Name System (DNS) records.
- An instance on a network that blocks incoming connections, as many home and mobile networks do, cannot be reached this
  way, and how it is reached needs a record of its own. Hole punching, and a meeting point run for each circle of peers,
  have been explored and not adopted.
- WebRTC, in which browsers connect to each other, was rejected, because each instance runs its own service and the
  instances call each other directly.
