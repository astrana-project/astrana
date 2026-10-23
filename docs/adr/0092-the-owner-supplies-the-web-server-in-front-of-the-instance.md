# 92. The owner supplies the web server in front of the instance

Proposed.

## Context

A web app needs a web server in front of it to handle secure connections, and the owner already looks after their own
hosting ([record 32](0032-every-instance-is-managed-by-its-owner-and-nobody-else-operates-it.md)). Web servers such as
Internet Information Services (IIS) and NGINX already handle certificates, Transport Layer Security (TLS) and protection
at the level of connections well, and the people who run servers know how to operate them. One layout everywhere is
easier to secure, document and support than several.

## Decision

Every installation runs behind a web server the owner supplies, IIS or NGINX, which passes requests on to the
application, including on a developer's own machine. The web server holds the certificate and renews it automatically,
by default through Let's Encrypt. The application listens only on the loopback interface, a Unix domain socket or a
private container network shared only with the web server, and refuses to start when configured to listen anywhere else.
It trusts forwarded headers, such as the client's address and the original scheme, only from the web server addresses it
is configured with.

## Consequences

- Handling certificates never touches the application itself.
- A misconfigured application cannot be exposed directly to the internet.
- The owner looks after the web server along with the rest of their hosting. On desktops and laptops the installer sets
  one up, and protects its configuration from tampering like the rest of the installation.
- Peers recognise each other by keys inside the connection
  ([record 63](0063-peers-authenticate-each-other-with-a-noise-handshake-inside-https.md)), so the certificate matters
  only to browsers.
- A browser trusts the certificate only for a domain name. Where no public domain is available, the web server uses a
  self-signed certificate, or one the owner brings, and an instance unreachable from the internet obtains a public
  certificate through a challenge in the Domain Name System (DNS) rather than over the Hypertext Transfer Protocol
  (HTTP).
- Because every request arrives through the web server, anything that depends on where a request came from, such as the
  setup page answering only on the host machine, judges it from the trusted forwarded address.
- Letting the application serve TLS itself was rejected because it would repeat what web servers do well and make the
  layout differ between installations.
