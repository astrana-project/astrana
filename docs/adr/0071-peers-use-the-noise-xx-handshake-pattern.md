# 71. Peers use the Noise XX handshake pattern

Proposed.

## Context

Peers authenticate each other with a Noise handshake
([record 70](0070-peers-authenticate-each-other-with-a-noise-handshake-inside-https.md)). The Noise protocol defines
several handshake patterns, which differ in whether each side must already know the other's key and in which side's
identity is exposed, and to whom, while the handshake runs. The patterns that authenticate both sides all give the
session forward secrecy once they complete.

## Decision

Every connection between peers uses the Noise XX pattern over X25519. In XX neither side needs the other's key in
advance. Each side sends its static key, which is its current transport key, encrypted during the handshake together
with the signatures that tie it to its identity key, and each checks the other's against the identity key it remembered.

## Consequences

- The calling side's identity is sent only to an instance that has already proved who it is, with forward secrecy.
- Any party that can reach an instance can learn its public identity key by starting a handshake. This is accepted,
  because the key is meant to be public, in return for the protection XX gives the calling side.
- A handshake takes two round trips before anything is exchanged.
- The same pattern serves a first connection, before either side has remembered the other's key, and every connection
  after it.
- Pattern names are two letters and easily transposed, so wherever the handshake is described, what the pattern does is
  described with it, so that a reader can tell whether the name in front of them is the right one.
- X25519 was chosen over the P-256 curve because the Noise specification defines only Curve25519 and Curve448. A Noise
  handshake over P-256 is non-standard, and the published test vectors and reference implementations do not cover it.
- The IK pattern was rejected. An instance would reveal nothing to strangers, but a calling side's identity would be
  exposed to anyone who later obtained the answering instance's key. Answering XX handshakes only when they carry a
  token issued at pairing was rejected for the tokens it would add to issue, store and revoke.
