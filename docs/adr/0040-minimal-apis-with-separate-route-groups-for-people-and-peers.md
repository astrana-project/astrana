# 40. Minimal APIs, with separate route groups for people and peers

Proposed.

## Context

The backend answers two very different callers. People reach it through the web app, and peers reach it from other
instances on their owners' behalf. The two authenticate differently, are trusted differently, are limited differently
and may do different things, and mixing them in one set of endpoints is a common source of flaws that grant more access
than intended. Endpoints are adapters that only translate
([record 31](0031-the-inside-defines-ports-and-the-outside-adapts-to-them.md)), and each lives in its feature's folder
([record 33](0033-code-is-organised-by-feature-for-locality-of-behaviour.md)).

## Decision

The backend's application programming interfaces (APIs) are ASP.NET Core minimal APIs. Each feature maps its endpoints
in a static class whose name ends in `Endpoints`, in its own folder, so that startup stays short. Endpoints for people
and endpoints for peers are in separate route groups, each with its own authorisation policies and rate limits, and they
share no authentication. People's endpoints authenticate with the session cookie, and how peers authenticate is decided
with the peer protocol.

An endpoint maps its inbound type to the use case's input, calls the use case, and maps the result to an outbound type
and a response, and does nothing else. Endpoints return typed results. Concerns shared by many endpoints are endpoint
filters on their route group. Inbound types are checked for shape by the validation built into minimal APIs, and rules
about meaning are enforced by the domain.

## Consequences

- An endpoint can be understood by reading one file, next to the use case it calls.
- An endpoint for people cannot accept a peer's credentials, or the other way round, because the groups share no
  authentication.
- Logic growing in an endpoint is easy to spot, and shows that it belongs in a use case or the domain.
- Typed results make endpoints simple to test and describe their responses accurately.
- The address and versioning of the peer route group are decided with the peer protocol.
- Controllers were rejected because their conventions and base classes add indirection without adding anything an
  adapter needs here.
