# 210. A viewer's own browser extensions are outside what Astrana protects against

Proposed.

## Context

Content from peers is shown in the viewer's own browser, where extensions the viewer installed can read and save what
the page shows. A page cannot reliably detect extensions, and the signals it can see fire for extensions people should
keep, such as password managers and accessibility tools.

## Decision

What an extension does in the viewer's own browser is outside what Astrana protects against. Astrana reduces exposure
through how it delivers media
([record 209](0209-video-reaches-the-browser-only-as-encrypted-parts-fetched-with-single-use-tokens.md)), by sending
only display copies and by leaving saving off by default
([record 180](0180-saving-shared-media-is-off-by-default-and-the-sharer-turns-it-on.md)), and explains the limit
honestly.

## Consequences

- People are told plainly that an extension can capture what they see, and are advised to use a browser profile with no
  extensions for sensitive use.
- Astrana never claims that media shown in a browser is safe from that browser's extensions
  ([record 176](0176-what-leaves-an-instance-can-be-kept-by-those-who-receive-it.md)).
- Detecting downloader extensions and refusing to play media was rejected. Detection found none of the downloaders
  tested, fired only for password managers and an accessibility tool, can be hidden or blocked by a hostile extension,
  and probing a visitor's browser is fingerprinting.
- Help for guardians can say what each platform allows in controlling a child's extensions, which differs widely.
