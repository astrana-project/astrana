# 70. Peers authenticate each other with a Noise handshake inside HTTPS

Proposed.

## Context

Peers need a protected connection that proves each side holds the key the other remembered
([record 38](0038-peers-recognise-each-other-by-keys-remembered-when-they-first-connect.md)), confirmed by a short code
when they first connect ([record 69](0069-two-people-confirm-a-short-code-before-their-instances-connect.md)). Instances
run in many kinds of place, and in most of them Transport Layer Security (TLS) ends somewhere other than the
application, such as a web server, a hosting provider or a cloud platform. Mutual TLS, in which both sides present a
certificate, only proves who is on the other end if TLS ends in the application itself, which most hosting does not
allow.

## Decision

Peers authenticate each other and protect what they exchange at the application level, with a Noise protocol handshake
carried inside ordinary Hypertext Transfer Protocol Secure (HTTPS). The key each side uses in the handshake is a
transport key, signed by a rotation key that the identity key signs, and each side checks that chain against the
identity key it remembered. Every message between peers is encrypted end to end. The outer TLS is defence in depth that
is never pinned, and a peer reaching an instance that has no domain name accepts whatever certificate it presents.

## Consequences

- Peer authentication works whoever ends TLS, behind any web server and on shared hosting, and certificate lifetimes
  never affect connections between peers.
- Peers need no certificate from a certificate authority and no domain name of their own to recognise each other.
- An instance with no domain name is reached by address, by a local name or behind a self-signed certificate. Checking
  its certificate against a pinned root and a name refused the real peer whenever it was reached by address, so the
  stricter check would fail on exactly the instances it was meant to protect.
- Anyone who can intercept the outer TLS of an instance with no domain name sees the method, path, headers, size and
  timing of every request between peers, though never their content, which the Noise handshake protects.
- The identity key never takes part in a handshake, so the running instance does not need to hold it.
- Astrana has to carry and maintain a Noise implementation
  ([record 4](0004-astrana-depends-on-outside-components-only-where-it-must.md)), and debugging or inspecting traffic
  between peers goes through two layers of encryption.
- Standard Noise uses Curve25519, so the runtime has to provide X25519 key agreement.
- Mutual TLS was rejected because it cannot prove identity where TLS ends outside the application.
