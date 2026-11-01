# 167. Passwords need ten characters, and have no composition rules or routine expiry

Proposed.

## Context

Every account with a password needs rules for choosing one and for when it must change. The National Institute of
Standards and Technology (NIST) publishes guidance on both, trusted by almost everyone in security. A second factor is
required ([record 126](0126-a-second-factor-is-required.md)).

## Decision

A password needs at least ten characters, and at least sixty-four are allowed. There are no composition rules. Every new
password is checked against a blocklist of common and breached passwords, and a password manager or passphrase is
encouraged when a password is chosen. A password never expires on a schedule, and a reset is forced only on evidence of
compromise.

## Consequences

- The guidance sets fifteen characters for a password used alone and a floor of eight where a second factor is present.
  Ten sits above the floor because a second factor is required, and would fall below the single-factor figure if that
  requirement were ever softened, so the two decisions stand together.
- Ten is a judgement, short enough to remember and longer than the floor, since the guidance gives no calculation behind
  its figures.
- Evidence of compromise means a known stolen database or backup, an integrity failure on account records, a match
  against a breach list, or the owner's decision after an incident.
- A dormant account on an old hashing algorithm has its old hash wrapped in the new one straight away. The wrapped hash
  expires after a set period, and a reset is required then.
- Composition rules and routine expiry were rejected, following the same guidance, which advises against both.
