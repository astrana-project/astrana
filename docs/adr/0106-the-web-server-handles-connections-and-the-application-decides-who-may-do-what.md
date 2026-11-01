# 106. The web server handles connections, and the application decides who may do what

Proposed.

## Context

Every installation runs behind a web server ([record 105](0105-every-installation-runs-behind-a-web-server.md)). Many
protections could be set in either layer, such as limits on requests, rate limits and security headers. Set in both,
they drift apart, and set in neither, they are missing, without anyone noticing either way.

## Decision

The web server is responsible for Transport Layer Security (TLS), versions of the Hypertext Transfer Protocol (HTTP),
limits on connections, the largest request it accepts, and closing stalled connections with timeouts tested on every
supported web server. The application is responsible for authentication, authorisation, rate limits and security
headers, the Content Security Policy included, and sets them identically behind every web server.

## Consequences

- Rate limits are set by the part that knows who is asking, so they can differ by kind of caller, and they answer
  `HTTP 429 - Too Many Requests` behind every web server.
- Abusive traffic reaches the application before it is rate limited, which costs work on modest hardware. The web
  server's limits on connections and request size are the first line against a flood.
- A stalled connection is held where the outer connection ends, so the web server's timeout is the one that matters, and
  the application's own limits are a second layer.
- Security headers are the same whichever web server an owner chooses, because the application sets them.
- The configuration Astrana supplies for each web server covers only what the web server is responsible for, and removes
  the stray headers a proxy module adds where it can. One such header cannot be removed. It is tolerated and documented,
  because an unwanted header leaks information rather than opening a vulnerability, and a promise to remove it could not
  be kept.
- Setting security headers in the web server was rejected, because they would then differ between the supported web
  servers, and an owner's own configuration could quietly remove them.
