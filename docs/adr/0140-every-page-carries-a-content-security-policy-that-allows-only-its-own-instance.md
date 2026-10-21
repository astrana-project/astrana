# 140. Every page carries a Content Security Policy that allows only its own instance

Proposed.

## Context

Content is cleaned and encoded ([record 102](0102-content-is-cleaned-when-it-comes-in-and-encoded-when-it-is-shown.md)),
input is validated wherever it is received ([record 121](0121-the-server-checks-everything-the-app-checks.md)), and
every file the frontend loads is served by its own instance
([record 139](0139-the-frontend-loads-assets-and-dependencies-only-from-its-own-instance.md)). All of these are carried
out by code, and any defence of that kind will sometimes miss something. Markup that reaches a page can carry script,
which runs with the same access as Astrana's own code.

A Content Security Policy is a set of rules the instance sends to the web browser with each page. It tells the browser
where the page may load files from, where it may connect and what script it may run, and the browser blocks anything the
policy does not allow, independently of Astrana's code.

## Decision

Every page the instance serves carries a Content Security Policy in its response headers. The policy denies by default
and allows the following.

- Files load only from the instance, and connections go only to the instance.
- Script runs only from files the instance serves. Inline script, and code built from text while the page runs, are
  blocked.
- Styles apply only from files the instance serves. Inline styles are blocked.
- Forms submit only to the instance.
- Only the instance's own pages may show one of its pages inside a frame.

Files that came from content, such as uploaded media, are served with a type the browser does not run as script, and the
browser is told not to guess a different type, so the policy's allowance for the instance's own files does not extend to
them.

## Consequences

- A single missed step in cleaning or encoding is a bug, not an incident, because it cannot become someone running their
  own code. This follows the same idea as stripping hidden details from photos, which is to assume the main protection
  will sometimes fail and make that failure survivable.
- Code that tries to send data to an outside server, such as an analytics or tracking script bundled by mistake, has its
  requests blocked by the browser.
- Other sites cannot show the app inside a frame, which protects people from pages that trick them into clicking
  something they cannot see.
- The frontend's code and the components it bundles have to work without inline script, inline styles or code built from
  text, which rules out some components.
- A change that needs a new source has to change the policy, and that change is reviewed like any other.
- Allowing inline script that carries a one-time value from the response, known as a nonce, was rejected, because the
  frontend has no need for inline script and a policy that allows none is simpler to check. Setting the policy in the
  page itself was rejected, because a policy set that way cannot control framing and takes effect only once the browser
  has started reading the page.
