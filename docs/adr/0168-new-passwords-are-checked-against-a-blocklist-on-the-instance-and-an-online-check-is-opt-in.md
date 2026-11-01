# 168. New passwords are checked against a blocklist on the instance, and an online check is opt-in

Proposed.

## Context

Every new password is checked against a blocklist of common and breached passwords
([Passwords need ten characters](0167-passwords-need-ten-characters-and-have-no-composition-rules-or-routine-expiry.md)).
The usual way is an online range check against a public breach service, and links are already checked against a list
held on the instance rather than by asking an outside service
([record 30](0030-links-are-checked-against-a-list-held-on-the-instance-never-by-sending-them-out.md)).

## Decision

Astrana builds its own blocklist from the most common breached passwords, ships it with each release, and checks new
passwords against it on the instance. The online range check is an option the owner can turn on, and is off by default.
If a check cannot be made, the bundled list still applies.

## Consequences

- Nothing about a password leaves the instance unless the owner chose the online check.
- Changing a password never fails because a check could not be made.
- The bundled list lags behind the latest breaches until the next release.
- The list can ship only if the breach data it is built from may be redistributed this way, which has to be confirmed
  before release.
- The online check by default was rejected, because every check reveals the instance's address, the time of each
  password change and part of the password's hash to outside parties the owner did not choose.
- Existing bundled lists were rejected because they come from older leaks and miss newer breached passwords, and the
  full breach set was rejected because it is too large for modest host machines.
