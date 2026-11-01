# 162. Astrana never collects biometric data

Proposed.

## Context

A passkey or an authenticator app is often unlocked with a fingerprint or a face
([record 160](0160-an-authenticator-app-is-the-default-second-factor-and-a-passkey-is-an-optional-full-sign-in-where-the-instance-has-a-stable-name.md)).
Biometric data cannot be changed once it leaks, and an instance holding it would hold something its owner could never
replace.

## Decision

Astrana never collects, stores or processes biometric data. Biometrics are used only through the operating system of a
person's own device, to unlock a passkey or an authenticator app.

## Consequences

- Unlocking a passkey with a fingerprint or a face is not a use of biometrics by Astrana, because only the device sees
  the biometric, and the instance receives the passkey's answer.
- No feature may rest on recognising a person's body, voice or face.
