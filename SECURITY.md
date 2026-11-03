# Security policy

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

If you have a fix, do not open a public pull request. Say so in the report, and the maintainer can work on it with you
in a private advisory.

### What to expect

- Acknowledgement within a week. If you hear nothing by then, your report may not have been seen. Follow up on the same
  report rather than opening a new one.
- An initial assessment and, if the report is accepted, a plan and rough timeline for a fix.
- Disclosure timing agreed with you. If you and the maintainer cannot agree, the default is 90 days from
  acknowledgement, or earlier if a fix has shipped or the issue is being exploited.
- There is no bug bounty. You will be credited in the advisory and in the affected application's changelog unless you
  prefer to remain anonymous.

## Scope

This project is responsible for the two applications in this repository and the releases built from them. They are the
Astrana application, which is the web app and the .NET server, and Astrana Owner Tools, which owners use to install,
back up, restore and manage their instances.

### In scope

- Reading or altering an instance's data, or acting as its owner, without the owner's credentials.
- Bypassing setup, sign-in or session protection, or reaching setup after it has completed.
- Leaking private data, credentials or configuration through a response, a log, the browser or the built web app.
- Reading a backup without the owner's recovery secret, or making Astrana Owner Tools act on an instance it was not
  pointed at.
- Cross-site scripting, request forgery or injection in the web app or the server.
- Anything that enables a peer or a stranger to learn more about an instance than it chose to share.
- A known vulnerability in a dependency, where it has a plausible impact on this code.

### Out of scope

- Problems that come from a misconfigured instance rather than a defect in this code.
- Denial of service by flooding an instance's network with traffic, as opposed to a flaw in how the application handles
  requests.
- A vulnerability in a browser, database, reverse proxy or operating system that Astrana runs on. Report it to whoever
  makes that software.

## Where to test

Test against the project's code, its releases or an instance you run yourself. Never test someone else's instance
without the owner's permission.

## Security releases

A fix ships as a new release with an entry in the affected application's changelog. The maintainer publishes a GitHub
security advisory for the repository and requests a Common Vulnerabilities and Exposures (CVE) identifier when the issue
needs one. To hear about fixes, watch the repository's releases and security advisories on GitHub.

## Supported versions

The maintainer fixes security vulnerabilities in a new release of the current major version. To get a fix, update to the
latest release of that major version. Older releases of it do not get the fix. Minor releases are designed to stay
compatible with the ones before them, so the update should need nothing else from you.

When a new major version is released, the previous major version keeps getting security fixes for six months. That is
how long owners have to move to the new major version before the move becomes mandatory. After that, the previous major
version gets no fixes, and neither do earlier ones.

Before version 1.0.0, only the latest release gets fixes.

Astrana Owner Tools follows the same rules for its own versions. A supported release of Astrana Owner Tools is made to
work with every major version of the Astrana application that still gets security fixes.

This is free and open source software maintained by one person with other commitments, so the response times, disclosure
terms and fixes are what the maintainer aims to provide, not a guarantee.
