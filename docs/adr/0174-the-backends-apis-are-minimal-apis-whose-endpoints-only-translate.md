# 174. The backend's APIs are minimal APIs, whose endpoints only translate

Proposed.

## Context

Endpoints are adapters that only translate between the outside and the use cases
([record 162](0162-the-inside-defines-ports-and-the-outside-adapts-to-them.md)), and each lives in its feature's folder
([record 164](0164-code-is-organised-by-feature-for-locality-of-behaviour.md)). Logic that grows in endpoints escapes
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
- Answers that must look alike to the caller ([record 94](0094-a-refusal-looks-the-same-as-finding-nothing.md)) are
  returned through shared typed results.
- Typed results make endpoints simple to test and describe their responses accurately.
- Rate limits are set in the application for each kind of caller
  ([record 96](0096-the-web-server-handles-connections-and-the-application-decides-who-may-do-what.md)), so they can
  differ between the owner, guests, apps acting for the owner and peers.
- Controllers were rejected because their conventions and base classes add indirection without adding anything an
  adapter needs here.
