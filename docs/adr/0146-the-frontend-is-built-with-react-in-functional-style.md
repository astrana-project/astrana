# 146. The frontend is built with React, in functional style

Proposed.

## Context

The frontend is a web app served by the instance
([record 19](0019-the-app-is-a-progressive-web-app-served-by-each-instance.md)). Its views change as data arrives from
the backend, and it is worked on by contributors who come and go. Keeping a page in step with changing data is a large
piece of work that a project would otherwise have to build and maintain itself.
[Record 4](0004-astrana-depends-on-outside-components-only-where-it-must.md) allows a third-party component where the
project could not build and maintain something as good. Content has to reach the page only as text
([record 142](0142-only-the-interfaces-own-code-produces-markup.md)), and the frontend has a budget for what the browser
downloads ([record 144](0144-the-frontend-has-a-download-and-response-budget-that-the-build-enforces.md)).

## Decision

The frontend is built with React. Components are written as functions.

## Consequences

- React puts values into the page as text unless code asks otherwise through `dangerouslySetInnerHTML`, which
  [record 142](0142-only-the-interfaces-own-code-produces-markup.md) rules out for content.
- A production build of React needs no inline script and no code built from text, so it runs under the Content Security
  Policy of [record 141](0141-every-page-carries-a-content-security-policy-that-allows-only-its-own-instance.md).
- React counts against the budget of
  [record 144](0144-the-frontend-has-a-download-and-response-budget-that-the-build-enforces.md), and can be a large part
  of what the browser downloads.
- Writing every component as a function gives the frontend one idiom, so a contributor needs to learn only one way of
  writing a component.
- React is widely used, so many contributors already know it.
- A new major version of React can require changes across the frontend.
- Components from React's wider ecosystem are judged one by one under
  [record 4](0004-astrana-depends-on-outside-components-only-where-it-must.md) and
  [record 36](0036-only-open-source-components-are-bundled.md). Working with React is not a reason to accept one.
- Building the frontend without a framework was rejected, because the project would have to build and maintain its own
  way of keeping the page in step with its data.
