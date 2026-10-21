# 11. All input is validated and sanitised

Proposed.

## Context

Input reaches Astrana from people using the frontend, from peers, from outside sites and services, from files and
imports, from backups being restored, from configuration, and through tools such as an installer or maintenance tools.
Any of it can be malformed or hostile, and input that is well formed can still be harmful where it ends up.

A peer runs software its owner controls, which may have been changed, may be out of date or may have been compromised,
and the frontend runs on devices the backend does not control. A check made in one part of Astrana cannot be relied on
by another. Checking input at several stages is defence in depth, because each check is a separate layer and a mistake
in one can be caught by another.

## Decision

Input that can be written in more than one form is first decoded and normalised to one standard form, so that a check
cannot be avoided by writing the same input another way. All input is then validated, wherever it is received, against
what is allowed for that kind of input, and what is malformed is rejected. Content that passes validation is sanitised
before it is stored or used, whether it was written on the instance, came from a peer or an outside site, or was
imported or restored from a backup. It is sanitised again before it leaves the backend, for the place it is going. The
backend checks every rule the frontend checks, and the backend's check decides whether the input is accepted.

- Each check denies by default. It describes what is allowed, rather than listing what is forbidden.
- Input that is unknown but well formed, such as a field from a peer running a newer version, is ignored rather than
  rejected.
- Input that cannot be checked, such as content a parser cannot read, is rejected.
- Input is limited in size and in the processing it can cause.
- Sanitising plain text removes only what is invalid, such as broken encoding or control characters, and keeps
  everything a person wrote.
- Addresses that came from content are validated before the backend fetches anything from them, so that content cannot
  direct the backend to places it should not reach.
- A backup being restored is checked like any other input.
- Each check is tested with malformed and hostile input, not only with what it should accept.

## Consequences

- Whatever a modified frontend or a hostile peer sends, only what the backend allows gets into the instance.
- Checks in the frontend give people quick feedback, such as pointing out a mistake before a form is sent, and are not
  relied on for protection.
- Instances on different versions can still work together, because unknown but well-formed input is ignored.
- A single large or deliberately crafted file cannot exhaust the instance.
- A backup that was damaged while stored elsewhere, or made by an older version under different rules, is caught
  before it is restored. One altered so that it still looks valid passes validation, so backups need protection of
  their own against tampering.
- Content stored before a validation or sanitising rule changed was checked under the old rule, and checks made when
  input is received do not reach it. Stored content can be checked again against the current rules, so content that
  would now be rejected or cleaned is found.
- Every part of Astrana that receives input carries its own checks, and the frontend's checks have to be kept in step
  with the backend's, which is more code to write and maintain.
- Storing content as received and sanitising it only before it leaves the backend, as is widely recommended, was
  rejected. Content stored unsanitised would depend on every place that later reads it to clean its output, and one
  that forgot would expose everything stored.
- Trusting content from a peer because the peer's instance had already checked it was rejected, because the peer's
  software may have been changed, may be out of date or may have been compromised.
