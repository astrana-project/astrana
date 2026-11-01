# 161. Authenticator codes are Astrana's own implementation, and each code is accepted only once

Proposed.

## Context

A code from an authenticator app is the default second factor
([record 160](0160-an-authenticator-app-is-the-default-second-factor-and-a-passkey-is-an-optional-full-sign-in-where-the-instance-has-a-stable-name.md)).
The framework's own support lets a code be entered several times before it expires, and authenticator apps differ in
which settings they honour.

## Decision

Astrana implements time-based one-time passwords (TOTP) itself, on the runtime's own cryptography, and tests the
implementation against the standard's published test vectors. Each secret is 160 random bits, encrypted under a key held
outside the database. A code is accepted from the current thirty-second step or one step either side, and each code is
accepted only once, by recording the last step accepted. The settings are the ordinary ones every app supports, the
Secure Hash Algorithm 1 (SHA-1), six digits and thirty seconds.

## Consequences

- A code seen over someone's shoulder or captured by a phishing page cannot be used a second time.
- Failed codes count towards lockout and rate limits.
- Setting up an app asks for one code before the secret is saved, which catches an app that ignored a setting, or a scan
  that went wrong, before anyone relies on it.
- Some apps are reported to ignore the settings they are given or to fall back silently on ones they do not recognise,
  so a stronger default would lock people out in a way they cannot diagnose.
- SHA-1's known weaknesses are collision attacks, which do not bear on this use. A draft revision of the standards would
  disallow it after 2030, and the algorithm is stored with each secret so that people can be moved to another one.
- Relying on the framework's default was rejected, because it accepts a code more than once.
