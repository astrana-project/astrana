# 140. The frontend loads assets and dependencies only from its own instance

Proposed.

## Context

A person uses Astrana through one instance, which fetches content from other instances for them, so no other server
needs to know they are using Astrana. A file fetched from an outside server tells that server the person's network
address and when they asked, lets a server used by many sites link their visits, and can breach data protection law.
Whoever controls that server controls what it sends, and code loaded from it runs with the same access as Astrana's own
code. The frontend also breaks when such a server is slow, blocked or gone, and what it sent at the time of use cannot
be confirmed afterwards.

## Decision

Every file the frontend loads, whether code, styles, fonts, images, icons, audio, video or anything else, is served by
the instance. Media from peers and from outside links reaches the frontend through the instance backend. The backend
makes requests of its own, such as link safety lookups, which are decided separately.

## Consequences

- Third-party components the frontend needs are bundled into the build and served by the instance.
- Fonts, icons and other assets are bundled only where their licences allow them to ship with Astrana.
- What the frontend runs is what the release was built with, so it is reviewed and released like the rest of Astrana.
- The instance serves every file and passes on every piece of media itself, so it carries bandwidth and processing that
  an outside server would otherwise carry.
- When the instance backend fetches media or link previews from addresses that came from content
  ([record 123](0123-the-server-checks-everything-the-app-checks.md)), it refuses internal and private network
  addresses, which an attacker could otherwise reach through it. Connections to peers use a separate mechanism, which
  may need to reach private addresses, such as when two instances share a home network or when network address
  translation has to be crossed.
- Media from outside sites, such as videos, is shown as a preview with a link. Embedding a player from an outside site
  would be an exception to this decision, and would need a decision of its own.
- A peer or an outside site serving media sees the address of the instance that fetches it, not of the browser viewing
  it. Where the instance runs on the person's own device or home network, the two can be the same.
- Requests the web browser makes for itself, such as delivering notifications through its push service, belong to the
  browser rather than the frontend. A notification's content is encrypted, so the push service sees when one arrives and
  cannot read it ([record 19](0019-the-app-is-a-progressive-web-app-served-by-each-instance.md)).
- Loading common libraries from a content delivery network was rejected. Browsers keep a separate cache for each site,
  so it saves little speed, and it would tell an outside server about the people using Astrana. Adding integrity checks
  would stop a changed file from running, but the part of the frontend that needs it would then fail instead.
