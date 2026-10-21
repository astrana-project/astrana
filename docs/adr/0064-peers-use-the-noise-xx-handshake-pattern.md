# 64. Peers use the Noise XX handshake pattern

Proposed.

## Context

Peers authenticate each other with a Noise handshake
([record 63](0063-peers-authenticate-each-other-with-a-noise-handshake-inside-https.md)). The Noise protocol defines
several handshake patterns, which differ in whether each side must already know the other's key and in which side's
identity is exposed, and to whom, while the handshake runs. Once any of them completes, both sides are authenticated and
the session has forward secrecy.

## Decision

Every connection between peers uses the Noise XX pattern, in which each side sends its static key, encrypted, during the
handshake, and each checks the other's against the key it remembered.

## Consequences

- The calling side's identity is sent only to an instance that has already proved who it is, with forward secrecy.
- Any party that can reach an instance can learn its public identity key by starting a handshake. This is accepted in
  return for the protection XX gives the calling side.
- A handshake takes two round trips before anything is exchanged.
- The same pattern serves a first connection, before either side has remembered the other's key, and every connection
  after it.
- The IK pattern was rejected. An instance would reveal nothing to strangers, but a calling side's identity would be
  exposed to anyone who later obtained the answering instance's key. Answering XX handshakes only when they carry a
  token issued at pairing was rejected for the tokens it would add to issue, store and revoke.
