# 161. Minimal APIs, with one set of paths for every caller

Proposed.

## Context

An instance answers several kinds of caller: the owner and the other accounts on the instance, apps acting for the owner
([record 102](0102-apps-acting-for-the-owner-use-a-narrow-form-of-oauth-2-1.md)), and peers
([record 61](0061-peers-authenticate-each-other-with-a-noise-handshake-inside-https.md)). What a caller may see is
decided by the instance holding the content
([record 86](0086-access-is-enforced-by-the-instance-that-holds-the-content.md)), and an owner reading their own profile
and a peer reading it ask the same question of different instances. Accepting whichever credential validates first is a
common way for one kind of caller to pass a check meant for another. Endpoints are adapters that only translate
([record 153](0153-the-inside-defines-ports-and-the-outside-adapts-to-them.md)), and each lives in its feature's folder
([record 155](0155-code-is-organised-by-feature-for-locality-of-behaviour.md)).

## Decision

The backend's application programming interfaces (APIs) are ASP.NET Core minimal APIs, with one set of paths that every
caller uses. Each request is resolved to exactly one caller before anything else happens, by its session, its access
token or its Noise channel, and a request carrying more than one credential is refused. One handler then makes one
decision about what that caller may see.

Each feature maps its endpoints in a static class whose name ends in `Endpoints`, in its own folder. An endpoint maps
its inbound type to the use case's input, calls the use case, and maps the result to an outbound type and a response,
and does nothing else. Endpoints return typed results. Concerns shared by many endpoints are endpoint filters. Inbound
types are checked for shape by the validation built into minimal APIs, and rules about meaning are enforced by the
domain.

## Consequences

- An endpoint can be understood by reading one file, next to the use case it calls.
- No path or parameter says whose data is wanted, so there is nothing a modified client can change to ask for more.
- A refusal, a request that matched nothing and an unreachable instance look the same to the caller
  ([record 87](0087-a-refusal-looks-the-same-as-finding-nothing-or-not-being-reached.md)), apart from a former peer, who
  is told the connection has ended ([record 58](0058-a-former-peer-learns-of-a-disconnection-when-they-next-ask.md)).
- Someone who has not signed in reaches nothing beyond the sign-in page and what installing the app needs
  ([record 11](0011-an-instance-shows-nothing-to-anyone-it-has-no-relationship-with.md)).
- Typed results make endpoints simple to test and describe their responses accurately.
- Separate paths for each kind of caller were rejected because they suggest the decision about what to show differs by
  caller, when only the identity feeding it does. Controllers were rejected because their conventions and base classes
  add indirection without adding anything an adapter needs here.
