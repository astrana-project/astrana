# 174. An instance behind carrier-grade address translation is detected, and the owner told

Proposed.

## Context

Peers reach each other directly, so an instance on a network that blocks incoming connections cannot be reached
([record 72](0072-peers-exchange-plain-requests-over-https-with-no-persistent-connection-between-them.md)). Many home
and mobile connections share one public address among many customers, through carrier-grade network address translation
(CGNAT), and an owner on such a connection usually cannot tell. An instance checks what it can about where it runs and
tells its owner
([record 173](0173-an-instance-checks-what-it-can-about-its-hosting-environment-rather-than-asking-the-owner.md)).

## Decision

Installation and the instance's health status detect when the instance is behind CGNAT, and tell the owner plainly that
peers cannot reach it, with the options. Owners are guided to Internet Protocol version 6 (IPv6) where their provider
and router allow incoming connections, or to hosting elsewhere.

## Consequences

- An owner learns why peers cannot reach them at the start, rather than from connections that never work.
- What the instance finds is told to its owner and nobody else
  ([record 135](0135-what-an-instance-finds-about-its-hosting-environment-is-told-to-its-owner-and-nobody-else.md)).
- One way to detect it, asking a public server for the instance's own address, is itself a request to a third party, and
  is one the owner should know about.
- A later option is a relay through a publicly reachable instance that both people trust, opted into by both. The
  handshake between peers keeps content encrypted end to end, but the relay sees who talks to whom and when.
- Overlay networks were not chosen as the general answer, although they get through, because they are hard for ordinary
  people to set up and one depends on a third party that sees the network.
