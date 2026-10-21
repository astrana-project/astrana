# 175. Only the signed-in web app is told the instance's version

Proposed.

## Context

A web app left open while its instance is updated would call the new application programming interface (API) with old
code, and an installed web app may also be cached by the browser
([record 19](0019-the-app-is-a-progressive-web-app-served-by-each-instance.md)). The web app can only reload itself if
it learns the version changed. A version number also tells an attacker which known vulnerabilities an instance may have,
and an instance shows nothing to anyone it has no relationship with
([record 11](0011-an-instance-shows-nothing-to-anyone-it-has-no-relationship-with.md)).

## Decision

The instance reports its version in responses to the signed-in web app, and the web app reloads itself when that version
changes. No other response carries the version, whether to someone who has not signed in, to a peer, or with an error.

## Consequences

- A web app never runs old code against a new API for longer than one request.
- Strangers and peers never learn which version an instance runs. Peers decide what they can do together by the
  capabilities each supports ([record 122](0122-peers-check-what-each-other-can-do-not-which-version-they-run.md)).
- Sending the version with every response was rejected because it would tell strangers which vulnerabilities to try.
