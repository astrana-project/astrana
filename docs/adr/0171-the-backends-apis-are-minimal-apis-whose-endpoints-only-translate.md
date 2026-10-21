# 171. The backend's APIs are minimal APIs, whose endpoints only translate

Proposed.

## Context

Endpoints are adapters that only translate between the outside and the use cases
([record 159](0159-the-inside-defines-ports-and-the-outside-adapts-to-them.md)), and each lives in its feature's folder
([record 161](0161-code-is-organised-by-feature-for-locality-of-behaviour.md)). Logic that grows in endpoints escapes
the domain's rules and is hard to find.

## Decision

The backend's application programming interfaces (APIs) are ASP.NET Core minimal APIs. Each feature maps its endpoints
in a static class whose name ends in `Endpoints`, in its own folder. An endpoint maps its inbound type to the use case's
input, calls the use case, and maps the result to an outbound type and a response, and does nothing else. Endpoints
return typed results. Concerns shared by many endpoints are endpoint filters. Inbound types are checked for shape by the
validation built into minimal APIs, and rules about meaning are enforced by the domain.

## Consequences

- An endpoint can be understood by reading one file, next to the use case it calls.
- Logic growing in an endpoint is easy to spot, and shows that it belongs in a use case or the domain.
- A refusal, a request that matched nothing and an unreachable instance look the same to the caller
  ([record 91](0091-a-refusal-looks-the-same-as-finding-nothing-or-not-being-reached.md)), apart from a former peer, who
  is told the connection has ended ([record 60](0060-a-former-peer-learns-of-a-disconnection-when-they-next-ask.md)), so
  endpoints return those answers alike.
- Someone who has not signed in reaches nothing beyond the sign-in page and what installing the app needs
  ([record 11](0011-an-instance-shows-nothing-to-anyone-it-has-no-relationship-with.md)).
- Typed results make endpoints simple to test and describe their responses accurately.
- Controllers were rejected because their conventions and base classes add indirection without adding anything an
  adapter needs here.
