# 163. No single sign-in factor may fail into a critical loss

Proposed.

## Context

People sign in with several factors, among them a password, an authenticator app, a passkey, recovery codes, and codes
or links sent by email ([record 126](0126-a-second-factor-is-required.md),
[record 160](0160-an-authenticator-app-is-the-default-second-factor-and-a-passkey-is-an-optional-full-sign-in-where-the-instance-has-a-stable-name.md)).
Email is optional on an instance
([record 81](0081-email-is-sent-through-small-replaceable-modules-and-never-directly-from-the-instance.md)), and any
factor can be lost, broken or unreachable.

## Decision

If any one sign-in factor is inaccessible or broken, the instance does not suffer a critical loss or failure as a
result. Every account always has another way in, and every security notice has another channel.

## Consequences

- Email is never the only way to sign in or to recover, and an emailed code is allowed only alongside another factor.
- The sign-in link a guest may use is never the only way in, and a password stays available.
- Where email is known to be broken, emailed codes and sign-in links are not offered at all.
- Email is never the only channel for a security notice
  ([record 53](0053-notifications-travel-by-web-push-with-email-only-as-a-supplement.md)), and the notice is always
  shown inside the instance.
- A passkey is never the only way in.
- Recovery is layered, so losing recovery codes leaves the next layer
  ([record 126](0126-a-second-factor-is-required.md)).
