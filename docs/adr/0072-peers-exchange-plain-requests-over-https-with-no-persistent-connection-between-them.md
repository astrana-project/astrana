# 72. Peers exchange plain requests over HTTPS, with no persistent connection between them

Proposed.

## Context

Peers that have approved each other ([record 2](0002-connections-are-mutual-and-nobody-follows-anyone.md)) and can
recognise each other ([record 70](0070-peers-authenticate-each-other-with-a-noise-handshake-inside-https.md)) still need
a way to exchange requests. Instances run on every kind of hosting the project supports, including shared hosting, where
a hosting provider decides what kinds of connection it will carry.

## Decision

Each instance is reachable over Hypertext Transfer Protocol Secure (HTTPS), through the web server in front of it, and
peers send requests straight to each other, much as one server talks to another. Each exchange is a plain request and
its response, and carries a sequence of Noise messages. No persistent socket is kept open between peers, and a peer
learns what has changed when it next asks.

## Consequences

- Peers can reach each other on any hosting that serves HTTPS, including shared hosting that allows no long-lived
  connection.
- One Noise message holds at most 65,535 bytes, and the Noise specification leaves framing to the application, so
  Astrana frames a sequence of messages within one exchange, which is how larger content such as media is carried.
- Without a standing connection, a peer hears of something new only when it next asks, so news between peers arrives
  with a delay.
- Real-time notifications between an instance and the browsers of the people who use it are a separate matter, and this
  decision does not touch them.
- An instance on cloud or web hosting can be reached directly, and a home server can reach the same position with port
  forwarding and dynamic Domain Name System (DNS) records.
- An instance on a network that blocks incoming connections, as many home and mobile networks do, cannot be reached this
  way.
- A WebSocket channel between peers was rejected, because a real shared hosting provider did not allow it, and a design
  that depended on it would exclude hosting that Astrana supports.
- Web Real-Time Communication (WebRTC), in which browsers connect to each other, was rejected, because instances are
  servers that can call each other directly and need none of the signalling or relays that WebRTC provides for browsers.
