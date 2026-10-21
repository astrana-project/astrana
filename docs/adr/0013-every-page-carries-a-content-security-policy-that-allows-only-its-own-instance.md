# 13. Every page carries a Content Security Policy that allows only its own instance

Proposed.

## Context

Input is validated and sanitised wherever it is received (record 11), and every file the frontend loads is served by
its own instance (record 12). Both are carried out by code, and a mistake in that code can let content reach a page as
markup. Markup that reaches a page can carry script, which runs with the same access as Astrana's own code.

A Content Security Policy is a set of rules the instance sends to the web browser with each page. It tells the browser
where the page may load files from, where it may connect and what script it may run, and the browser blocks anything
the policy does not allow. The browser enforces it independently of Astrana's code, so it can stop a mistake that the
checks in records 11 and 12 missed.

## Decision

Every page the instance serves carries a Content Security Policy in its response headers. The policy denies by default
and allows the following.

- Files load only from the instance, and connections go only to the instance.
- Script runs only from files the instance serves. Inline script, and code built from text while the page runs, are
  blocked.
- Styles apply only from files the instance serves. Inline styles are blocked.
- Forms submit only to the instance.
- Only the instance's own pages may show one of its pages inside a frame.

Files that came from content, such as uploaded media, are served with a type the browser does not run as script, and
the browser is told not to guess a different type. The policy's allowance for the instance's own files then does not
extend to them.

## Consequences

- Script injected into a page cannot run inline and has no approved source except the instance itself, so a mistake in
  checking content is not enough on its own to run injected script.
- Code that tries to send data to an outside server, such as an analytics or tracking script bundled by mistake, has
  its requests blocked by the browser.
- Other sites cannot show the frontend inside a frame, which protects people from pages that trick them into clicking
  something they cannot see.
- The frontend's code and the components it bundles have to work without inline script, inline styles or code built
  from text, which rules out some components.
- A change that needs a new source has to change the policy, and that change is reviewed like any other.
- The policy protects people only in a browser that enforces it, which every major browser does.
- Allowing inline script that carries a one-time value from the response, known as a nonce, was rejected. The frontend
  has no need for inline script, and a policy that allows none is simpler to check.
- Setting the policy in the page itself, rather than in the response headers, was rejected, because a policy set that
  way cannot control framing and takes effect only once the browser has started reading the page.
