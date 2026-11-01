# 129. An authenticator app is the default second factor, and a passkey is an optional full sign-in where the instance has a stable name

Proposed.

## Context

A second factor is required ([record 110](0110-a-second-factor-is-required.md)), and the kinds on offer differ in how
easily they can be stolen, how easy they are to use and where they work. A passkey is bound to the name of the site it
was registered on, and the standard behind it refuses a site reached by an address alone. Not every instance has a name
that stays the same.

## Decision

A time-based code from any standard authenticator app is the default second factor, because it works on every instance.
Where an instance has a stable name, meaning a public domain or a local network name with a trusted certificate and never
an address, a person may also register a passkey. A passkey that requires user verification is a full sign-in on its
own. A passkey is never the only way in, and the password with an authenticator app stays available beside it. An
emailed code may only ever be an extra, never the only second factor.

## Consequences

- A passkey is the hardest kind to phish, and one with user verification proves both the device and the person's
  personal identification number (PIN) or biometric unlock, which is why it can stand alone.
- User verification is required explicitly, and the instance's site name is always set explicitly and never taken from
  the host header of a request, so a request carrying another name cannot decide it.
- A passkey registered on one name does not work on another. An instance reachable under two names needs a set of
  passkeys for each, and people are warned before any change of name, including a move from a local name to a public
  domain. A documented step can bridge a planned change.
- A passkey synced between devices depends on the large platform account that syncs it.
- Losing every passkey never locks anyone out, because losing access could cost a great deal of very personal data.
- Passkeys use the framework's own passkey handler over Astrana's account store. A third-party package was rejected for
  the dependencies and advisories it brought and for accepting a changed backup-eligibility flag that the framework's
  handler refused. A verifier of Astrana's own was rejected because all of its security-critical parsing would be
  Astrana's to maintain.
- Putting a passkey first was rejected, because an instance reached by an address cannot use one at all.
- Codes sent by text message are not offered, because a phone carrier would then sit in the sign-in path.
