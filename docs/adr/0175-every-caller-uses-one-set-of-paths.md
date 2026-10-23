# 175. Every caller uses one set of paths

Proposed.

## Context

An instance answers several kinds of caller: the owner and the other accounts on the instance, apps acting for the owner
([record 111](0111-apps-acting-for-the-owner-use-a-narrow-form-of-oauth-2-1.md)), and peers
([record 66](0066-peers-authenticate-each-other-with-a-noise-handshake-inside-https.md)). What a caller may see is
decided by the instance holding the content
([record 93](0093-access-is-enforced-by-the-instance-that-holds-the-content.md)), and an owner reading their own profile
and a peer reading it ask the same question of different instances.

## Decision

Every kind of caller uses the same set of paths. The owner reading their own profile and a peer reading it call the same
path on different instances, and the answer differs only by who asked.

## Consequences

- One handler makes one decision about what to show, with the owner as the caller entitled to most rather than a special
  case with routes of their own.
- No path or parameter says whose data is wanted, so there is nothing a modified client can change to ask for more.
- One handler has to shape its answer for every kind of caller, so a mistake in it can show one caller what was meant
  for another.
- Separate paths for each kind of caller were rejected, because they suggest the decision about what to show differs by
  caller, when only the identity feeding it does.
