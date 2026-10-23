# 147. The browser never holds credentials or tokens

Proposed.

## Context

Anything a page's scripts can read, an injected script can read too. A token kept where scripts can reach it turns a
single flaw that lets script run into a stolen session, which can keep working after the flaw is fixed.

## Decision

The backend owns every session. It gives the browser only a session cookie, which scripts cannot read, marked
`HttpOnly`, `Secure` and `SameSite=Strict`. The frontend does not store a password, an access token or a key in the
browser.

A page opened from a link on another site arrives without the cookie, so the pages the instance serves do not depend on
the session. The frontend asks the backend for the session once a page has loaded.

## Consequences

- The backend attaches whatever credentials its own calls need, and none of them reach the browser.
- Signing out and revoking a session take effect on the backend at once, with nothing left in the browser to reuse.
- An injected script can act only while the page is open and cannot take the session away with it. Records
  [103](0107-content-is-cleaned-when-it-comes-in-and-encoded-when-it-is-shown.md) and
  [142](0146-only-the-interfaces-own-code-produces-markup.md) make injection unlikely in the first place, and
  [record 145](0145-every-page-carries-a-content-security-policy-that-allows-only-its-own-instance.md) limits what an
  injected script can reach.
- Pages on other sites cannot make requests with the person's session, because the browser sends the cookie only with
  requests from the same site. A site here is the registered domain, so an instance at an address under a shared domain
  shares its site with the other addresses under it, unless that domain is listed as a public suffix.
- Software acting for a person outside the frontend, such as a browser extension or a command-line tool, needs its own
  credential that can be revoked, which is a separate decision.
- Keeping tokens in browser storage was rejected, because every script on the page can read that storage.
