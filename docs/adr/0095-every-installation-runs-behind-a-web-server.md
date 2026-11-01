# 95. Every installation runs behind a web server

Proposed.

## Context

A web app needs a web server in front of it to handle secure connections, and the owner already looks after their own
hosting ([record 35](0035-every-instance-is-managed-by-its-owner-and-nobody-else-operates-it.md)). Web servers such as
Internet Information Services (IIS), NGINX and Caddy already handle certificates, Transport Layer Security (TLS) and
protection at the level of connections well, and the people who run servers know how to operate them. One layout
everywhere is easier to secure, document and support than several.

## Decision

Every installation runs behind a web server acting as a reverse proxy, which passes requests on to the application, on
every platform, macOS and a developer's own machine included. NGINX, Caddy and IIS have primary support, and are set up
by Astrana Owner Tools and tested on every release. Caddy is the one used on macOS, and may be the one offered by
default at installation. Any other web server is supported through an example configuration that Astrana publishes and
has tested.

The web server holds the certificate and renews it automatically, by default through Let's Encrypt. The application
listens only on the loopback interface or a Unix domain socket, and refuses to start when configured to listen anywhere
else. It trusts forwarded details, such as the client's address and the original scheme, only from the local machine.

## Consequences

- A reverse proxy separates the application from the internet, leaves encryption to software built for it, gives one
  place for limits on connections, and can show a maintenance page while the application is stopped.
- Handling certificates never touches the application itself.
- The application itself cannot be made to listen publicly. The web server's own configuration remains the owner's
  responsibility, and a misconfigured web server can still expose what it passes on.
- On a server the owner looks after the web server along with the rest of their hosting. Elsewhere Astrana Owner Tools
  sets one up, and its configuration resists accidental and unprivileged change like the rest of the installation. On
  shared hosting the hosting provider runs it.
- Owner Tools configures one supported web server to send the original scheme, which it does not send by default,
  because without it the application would not know a request arrived securely.
- A web server's automatic installation of its own certificate authority into the machine's trust store is switched off,
  because changing what a machine trusts is a security change the owner should agree to, not a by-product of starting a
  web server.
- Caddy obtains and renews certificates itself and runs as a service on Linux, Windows and macOS, so it can be set up
  where IIS is unavailable and NGINX is awkward to package, such as on a Mac. Bundled with an installation, it is a
  component Astrana ships and keeps current.
- A web server gets primary support only when it is widely used, mature, safe, stable and reliable, and works with the
  application. Adding one needs a record of its own once researched against the same test.
- A web server with an example configuration only, such as Apache, is not set up by Owner Tools and is not tested on
  every release. That is a real level of support, honest about its limits.
- Peers recognise each other by keys inside the connection
  ([record 66](0066-peers-authenticate-each-other-with-a-noise-handshake-inside-https.md)), so the certificate matters
  only to browsers.
- A browser trusts the certificate only for a domain name. Where no public domain is available, the web server uses a
  self-signed certificate, or one the owner brings, and an instance unreachable from the internet obtains a public
  certificate through a challenge in the Domain Name System (DNS) rather than over the Hypertext Transfer Protocol
  (HTTP).
- Because every request arrives through the web server, anything that depends on where a request came from, such as the
  setup page answering only on the host machine, judges it from the trusted forwarded address.
- Letting the application serve TLS itself was rejected because it would repeat what web servers do well and make the
  layout differ between installations.
