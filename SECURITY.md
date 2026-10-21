# Security Policy

Astrana is security-sensitive software. Each instance contains its owner's private personal data and their relationships
with other people's instances.

## Reporting a vulnerability

**Please do not open a public issue for a security vulnerability.** Public disclosure before a fix is available puts
every instance at risk.

Report privately through either channel:

- GitHub private vulnerability reporting, from the **Security** tab via **Report a vulnerability**. This opens a private
  advisory visible only to you and the maintainer.
- Email to [security@astrana.org](mailto:security@astrana.org). You can encrypt to the address's OpenPGP key,
  fingerprint `F575 DF23 75AE 0F8F 5A7B 330C 6B57 B3E4 4B8F ACA4`, published on
  [Proton's key server](https://api.protonmail.ch/pks/lookup?op=get&search=security@astrana.org). Mail sent from another
  Proton Mail account is end-to-end encrypted automatically.

Please include enough detail to reproduce and assess the issue, such as the affected version, the affected endpoint,
page or component, the impact and a proof of concept or steps to reproduce where possible.

If you have a fix, do not open a public pull request. Say so in the report, and we can work on it together in a private
advisory.

### What to expect

- Acknowledgement within a week. If you hear nothing by then, your report has not been seen. Follow up on the same
  report rather than opening a new one.
- An initial assessment and, if the report is accepted, a plan and rough timeline for a fix.
- Disclosure timing agreed with you. If we cannot agree, the default is 90 days from acknowledgement, or earlier if a
  fix has shipped or the issue is being exploited.
- There is no bug bounty. You will be credited in the advisory and in `CHANGELOG.md` unless you prefer to remain
  anonymous.

## Scope

This project is responsible for the Astrana application in this repository: the web app, the .NET server and the
images built from them.

### In scope

- Reading or altering an instance's data, or acting as its owner, without the owner's credentials.
- Bypassing setup, sign-in or session protection, or reaching setup after it has completed.
- Leaking private data, credentials or configuration through a response, a log, the browser or the built web app.
- Cross-site scripting, request forgery or injection in the web app or the server.
- Anything that enables a peer or a stranger to learn more about an instance than it chose to share.
- A known vulnerability in a dependency or in a published image's base layer, where it has a plausible impact on this
  code.

### Out of scope

- Issues that require a misconfigured deployment rather than a defect in this code.
- Denial of service by flooding an instance's network with traffic, as opposed to a flaw in how the application handles
  requests.
- A vulnerability in a browser, database, reverse proxy or operating system that Astrana runs on. Report it to whoever
  makes that software.

## Where to test

Test against the project's code, its published images or an instance you run yourself. Never test someone else's
instance without the owner's permission.

## Security releases

A fix ships as a new release with an entry in `CHANGELOG.md`. The maintainer publishes a GitHub security advisory for
the repository and requests a Common Vulnerabilities and Exposures (CVE) identifier when the issue needs one. To hear
about fixes, watch the repository's releases and security advisories on GitHub.

## Supported versions

Security issues are fixed in the latest release, so to get a fix, update to the latest release. Older releases do not
get fixes.

This is free and open source software maintained by one person with other commitments, so the response times, disclosure
terms and fixes are what the maintainer aims to provide, not a guarantee.
