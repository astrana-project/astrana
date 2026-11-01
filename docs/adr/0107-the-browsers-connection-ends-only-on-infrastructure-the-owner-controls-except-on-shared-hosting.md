# 107. The browser's connection ends only on infrastructure the owner controls, except on shared hosting

Proposed.

## Context

Every installation runs behind a web server that ends the browser's secure connection
([record 105](0105-every-installation-runs-behind-a-web-server.md)). Public tunnels and content delivery networks offer
to end that connection on their own machines, which can make an instance easier to reach. Whoever ends the connection to
a browser sees everything it carries and can change the code the browser runs.

## Decision

The browser's connection to an instance ends only on infrastructure the owner controls. Astrana does not offer or
recommend any third party that ends it, such as a public tunnel or a content delivery network that does. Shared hosting
is the accepted exception, where the hosting provider ends it.

## Consequences

- Nobody but the owner can alter what an instance's web app runs in a browser, except on shared hosting.
- An extra layer of encryption inside the page was rejected, because whoever ends the connection can change the page
  that does the encrypting, so it would stop only a passive watcher.
- Shared hosting stays possible
  ([record 68](0068-an-instance-may-run-on-the-owners-own-hardware-or-on-hosting-they-rent.md)), and an owner who
  chooses it trusts the hosting provider with the connection as with the machine.
- An owner who cannot be reached from the internet needs another way in that ends on their own infrastructure, such as a
  private network to their own devices.
