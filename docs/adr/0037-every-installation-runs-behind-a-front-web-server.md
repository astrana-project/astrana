# 37. Every installation runs behind a front web server

Proposed.

## Context

Browsers and peers reach instances on the public internet, on home networks and on shared hosting. Web servers and
reverse proxies such as Internet Information Services (IIS) and NGINX already handle certificates, Transport Layer
Security (TLS), versions of the Hypertext Transfer Protocol (HTTP) and protection at the level of connections, and the
people who run servers know how to operate them. One layout everywhere is easier to secure, document and support than
several. Each environment runs the same application under a different host
([record 35](0035-hosts-are-adapters-around-one-application.md)).

## Decision

Every installation runs behind a front web server, such as IIS or NGINX. The backend listens only on the loopback
interface, a Unix domain socket, or a private container network shared only with the front web server, or it runs in
process under IIS, and it refuses to start when configured to listen anywhere else. TLS for browsers and peers ends at
the front web server, with a certificate from Let's Encrypt or one bought from a certificate authority. The backend
trusts forwarded headers, such as the client's address and the original scheme, only from the front web server addresses
it is configured with.

The front web server is responsible for TLS, HTTP versions, limits on connections and the largest request it accepts.
The backend is responsible for authentication, authorisation, rate limits and security headers, because it knows who is
asking, and because these must not depend on which front web server is used.

## Consequences

- Certificates, TLS and protection at the level of HTTP are handled by software built for them, in every installation.
- A misconfigured backend cannot be exposed directly to the internet.
- Peer identity cannot rely on TLS, because TLS ends at the front web server, so instances authenticate each other
  inside the connection.
- Installers for desktops and laptops have to install and configure a front web server, and protect its configuration
  from tampering like the rest of the installation.
- An instance needs a domain name for a public certificate. An instance on a home network that cannot be reached from
  the internet has to obtain its certificate through a challenge in the Domain Name System (DNS) rather than over HTTP.
- Some ways of distributing desktop software cannot install a front web server, so supporting them needs a record of its
  own.
- A direct connection between instances after crossing network address translation would bypass the front web server, so
  it needs a record of its own.
- Letting the backend serve TLS itself was rejected because it would repeat what front web servers do well and make the
  layout differ between installations.
