# 96. The web server handles connections, and the application decides who may do what

Proposed.

## Context

Every installation runs behind a web server ([record 95](0095-every-installation-runs-behind-a-web-server.md)). Many
protections could be set in either layer, such as limits on requests, rate limits and security headers. Set in both,
they drift apart, and set in neither, they are missing, without anyone noticing either way.

## Decision

The web server is responsible for Transport Layer Security (TLS), versions of the Hypertext Transfer Protocol (HTTP),
limits on connections and the largest request it accepts. The application is responsible for authentication,
authorisation, rate limits and security headers.

## Consequences

- Rate limits are set by the part that knows who is asking, so they can differ by kind of caller.
- Abusive traffic reaches the application before it is rate limited, which costs work on modest hardware. The web
  server's limits on connections and request size are the first line against a flood.
- Security headers are the same whichever web server an owner chooses, because the application sets them.
- The configuration Astrana supplies for each web server covers only what the web server is responsible for.
- Setting security headers in the web server was rejected, because they would then differ between the supported web
  servers, and an owner's own configuration could quietly remove them.
