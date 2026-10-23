# 68. Peers talk directly over HTTPS, with a WebSocket channel for notifications

Proposed.

## Context

Peers that have approved each other ([record 2](0002-connections-are-mutual-and-nobody-follows-anyone.md)) and can
recognise each other ([record 66](0066-peers-authenticate-each-other-with-a-noise-handshake-inside-https.md)) still need
a way to exchange requests.

## Decision

Each instance is reachable over Hypertext Transfer Protocol Secure (HTTPS), through the web server in front of it, and
peers send requests straight to each other, much as one server talks to another. A lightweight WebSocket channel carries
notifications.

## Consequences

- An instance on cloud or web hosting can be reached directly, and a home server can reach the same position with port
  forwarding and dynamic Domain Name System (DNS) records.
- Notifications on the WebSocket channel are encrypted end to end like every other message between peers
  ([record 66](0066-peers-authenticate-each-other-with-a-noise-handshake-inside-https.md)).
- An instance on a network that blocks incoming connections, as many home and mobile networks do, cannot be reached this
  way.
- Web Real-Time Communication (WebRTC), in which browsers connect to each other, was rejected, because instances are
  servers that can call each other directly and need none of the signalling or relays that WebRTC provides for browsers.
