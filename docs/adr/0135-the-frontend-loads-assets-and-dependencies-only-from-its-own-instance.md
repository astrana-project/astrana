# 135. The frontend loads assets and dependencies only from its own instance

Proposed.

## Context

A person uses Astrana through one instance, in a web browser. For an instance owner it is their own instance, and for a
guest it is the one they were invited to. That instance fetches content from other instances and shows it to them, and
they never connect to another instance directly. No server other than that instance needs to know they are using
Astrana, so none should. The web browser is infrastructure a person relies on, like their operating system, and Astrana
expects them to use one that is safe and reliable.

When the frontend fetches a file from an outside server, that server sees the network address the request came from,
usually the person's own, and when the request was made. By default it also learns which instance the request came from.
An outside server used by many sites can link a person's visits across all of them. Sending people's addresses to a
third party without need can breach data protection law in many places, and expose the instance owner to legal claims
they are better spared.

Neither the project nor the instance owner has any control over a file on an outside server. Whoever controls an outside
server controls what it sends, and that can change when the server changes hands, is attacked or is misconfigured. A
change can break the frontend or bring in security and safety problems, and code loaded that way runs with the same
access as Astrana's own code.

The frontend has to work as designed wherever the instance can be reached. One that depends on an outside server can
break or degrade when that server is slow or unavailable, when it shuts down for good, when it cannot be reached from
the person's network or country, when a person's content blocker refuses it, or when a home network loses its internet
connection. Every outside server adds a connection to set up, which can slow the first load on a poor connection. Files
from outside servers can make the frontend harder to keep working offline.

The frontend has to be predictable and stable, and it has to be possible to confirm what it runs. Code loaded from an
outside server at the time of use usually cannot be confirmed afterwards, because what that server sent is not recorded.

## Decision

Every file the frontend loads, whether code, styles, fonts, images, icons, audio, video or anything else, is served by
the instance. Media from peers and from outside links reaches the frontend through the instance backend. The backend
makes requests of its own, such as link safety lookups, which are decided separately.

## Consequences

- Third-party components the frontend needs are bundled into the build and served by the instance.
- Fonts, icons and other assets are bundled only where their licences allow them to ship with Astrana.
- What the frontend runs is what the release was built with, so it is covered by the same review, pinned versions and
  bill of materials as the rest of Astrana.
- The instance serves every file and passes on every piece of media itself, so it carries bandwidth and processing that
  an outside host would otherwise carry.
- When the instance backend fetches media or link previews from addresses that came from content (record 117), it
  refuses internal and private network addresses, which an attacker could otherwise reach through it. Connections to
  peers use a separate mechanism, which may need to reach private addresses, such as when two instances share a home
  network or when network address translation has to be crossed.
- Media from outside sites, such as videos, is shown as a preview with a link. Embedding a player from an outside site
  would be an exception to this decision, and would need a decision of its own.
- A peer or an outside site serving media sees the address of the instance that fetches it, not of the browser viewing
  it. Where the instance runs on the person's own device or home network, the two can be the same.
- Requests the web browser makes for itself, such as delivering notifications through its push service, are part of that
  infrastructure rather than the frontend. A notification's content is encrypted, so the push service sees when one
  arrives and cannot read it (record 19).
- Loading common libraries from a content delivery network was rejected. Browsers keep a separate cache for each site,
  so it saves little speed, and it would tell an outside server about the people using Astrana. Adding integrity checks
  would stop a changed file from running, but the part of the frontend that needs it would then fail instead.
