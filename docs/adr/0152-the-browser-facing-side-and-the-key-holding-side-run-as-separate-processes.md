# 152. The browser-facing side and the key-holding side run as separate processes

Proposed.

## Context

An instance holds keys whose loss would be serious, above all the identity key that proves who the instance is to its
peers ([record 128](0128-the-identity-database-and-backup-keys-are-independent.md)). A stolen identity key would let
someone else answer as the instance. The part of the backend that browsers reach, serving the app, signing people in and
answering every browser request, is the largest surface an attacker can try. A boundary between that surface and the
keys holds only if it is a boundary the operating system enforces, which code inside one process cannot provide.

## Decision

The backend runs as two processes. The browser-facing process serves the app shell, signs people in, holds their
sessions ([record 147](0147-the-browser-never-holds-credentials-or-tokens.md)) and answers every browser request. The
application programming interface (API) process holds the keys and does the work that needs them. It is reached by the
browser-facing process only through a local socket that is never exposed to the network, and by peers through the web
server in front of the instance ([record 95](0095-every-installation-runs-behind-a-web-server.md)), because the Noise
handshake uses the instance's Noise key, which the identity key signs, and the API process holds both
([record 66](0066-peers-authenticate-each-other-with-a-noise-handshake-inside-https.md)).

## Consequences

- An attacker who compromises the browser-facing process cannot read the keys, which never leave the API process.
- While the compromise lasts, the browser-facing process can still ask the API process for anything it normally asks
  for. The separation protects the keys from theft, not the instance from misuse.
- The API process is also reached by peers, so it remains exposed to the internet through the web server.
- There are two processes to install, supervise, update and authenticate to each other.
- How the two processes run on shared hosting, where a hosting provider may allow only one application, needs a record
  of its own.
- A single process was rejected because a flaw anywhere in the browser-facing code would expose the keys.
