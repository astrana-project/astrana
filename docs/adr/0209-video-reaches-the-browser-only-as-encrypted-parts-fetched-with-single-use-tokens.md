# 209. Video reaches the browser only as encrypted parts fetched with single-use tokens

Proposed.

## Context

Downloader extensions save a playable file from ordinary web video, and some fetch the media again using the page's own
session cookie, so being signed in does not stop them. Media is always served through the application
([record 23](0023-media-is-always-served-through-the-application-never-as-direct-access-to-a-file.md)), and the browser
never holds credentials ([record 208](0208-the-browser-never-holds-credentials-or-tokens.md)).

## Decision

Video is sent to the browser in parts. Each part is requested with a token that works once, lasts a few seconds and is
bound to the viewer's session, and each part is encrypted and decrypted in the page. There is no playlist file and no
plain address for the media.

## Consequences

- Downloader extensions measured against it neither listed the protected video nor saved it, and a captured request
  failed when replayed outside the session or after use.
- It does not stop a program that holds the session cookie and repeats the page's own requests, which is why the
  instance also limits media requests per account. It does not stop a script running in the page, recording, frame
  snapshots or screen capture, and the interface says so.
- The tokens are between the browser and the viewer's own instance
  ([record 177](0177-each-instance-enforces-only-what-it-serves.md)), which receives the media from the sharing
  instance.
- It adds a short delay before the first frame and changes processor use a little, in either direction depending on the
  browser.
- Videos pause when scrolled out of view or when the tab is hidden, and their parts are dropped, which saves the
  sharer's bandwidth and the instance's memory.
