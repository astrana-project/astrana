# 61. Peers authenticate each other with a Noise handshake inside HTTPS

Proposed.

## Context

Peers need a protected connection that proves each side holds the key the other remembered
([record 34](0034-peers-recognise-each-other-by-keys-remembered-when-they-first-connect.md)), confirmed by a short code
when they first connect ([record 60](0060-two-people-confirm-a-short-code-before-their-instances-connect.md)). Instances
run in many kinds of place, and in most of them Transport Layer Security (TLS) ends somewhere other than the
application, such as a web server, a hosting provider or a cloud platform. Mutual TLS, in which both sides present a
certificate, only proves who is on the other end if TLS ends in the application itself, which most hosting does not
allow.

## Decision

Peers authenticate each other and protect what they exchange at the application level, with a Noise protocol handshake
carried inside ordinary Hypertext Transfer Protocol Secure (HTTPS). Every connection uses the Noise XX pattern, in which
each side sends its static key encrypted during the handshake, and each checks the other's against the key it
remembered. The instance's identity key signs its Noise key, every message between peers is encrypted end to end, and
the outer TLS is defence in depth that is never pinned.

## Consequences

- Peer authentication works whoever ends TLS, behind any web server and on shared hosting, and certificate lifetimes
  never affect connections between peers.
- Peers need no certificate from a certificate authority and no domain name of their own to recognise each other.
- The calling side's identity is sent only to an instance that has already proved who it is, with forward secrecy.
- Any party that can reach an instance can learn its public identity key by starting a handshake. This is accepted in
  return for the protection XX gives the calling side.
- Standard Noise uses Curve25519, so the runtime has to provide X25519 key agreement.
- Mutual TLS was rejected because it cannot prove identity where TLS ends outside the application. The Noise IK pattern
  was rejected, because although an instance would reveal nothing to strangers, a calling side's identity would be
  exposed to anyone who later obtained the answering instance's key.
