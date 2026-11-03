# Agent instructions

These instructions are for every artificial intelligence (AI) coding tool working in this repository. Everything in
[CONTRIBUTING.md](CONTRIBUTING.md) applies to the code and documents you write or edit, so read it before changing
anything.

## The repository

This repository contains the Astrana application in `application/`, with its web app in `application/frontend/` and its
.NET projects in `application/backend/`. It also contains Astrana Owner Tools in `owner-tools/`, code both use in
`shared/`, and tests that span both in `testing/`. Each project keeps its tests in a `test/` folder beside `src/`. The
[layout](README.md#layout) in the README shows where everything is.

Decision records about how Astrana is designed and built go in `docs/adr/`, beside the mission and vision.

## Acting for someone

Commit, push, open a pull request or create an issue only when the person you are working for asks you to. Never delete
a file unless they tell you to. Ask before any major change, such as moving or renaming files, restructuring the
repository, or adding, removing or upgrading a dependency or runtime. When you open a pull request, credit yourself as
[Open a pull request](CONTRIBUTING.md#open-a-pull-request) describes.

## Test-driven development

You are held to a stricter rule than human contributors. Work test first, always, in red, green, refactor:

1. Red. Before you write or change any code, write the test that describes the behaviour you want. Run it and see it
   fail for the reason you expect.
2. Green. Write the smallest code that makes it pass.
3. Refactor. Tidy the code only while every test passes.

- A bug fix starts with a test that reproduces the bug.
- Do not write code that no failing test asked for.
- Do not change a test to make it pass, unless a decision has changed the behaviour it describes.

## Where the rules are

- Tests every contributor must provide, in [Tests](CONTRIBUTING.md#tests)
- Code style, in [Code](CONTRIBUTING.md#code), and dependencies, in [Dependencies](CONTRIBUTING.md#dependencies)
- Accessibility and Astrana's own look, in [The interface](CONTRIBUTING.md#the-interface)
- The security rules and secrets, in [Security and secrets](CONTRIBUTING.md#security-and-secrets)
- Formatting, in [Format your changes](CONTRIBUTING.md#format-your-changes)
- Signing off commits, in [Sign off every commit](CONTRIBUTING.md#sign-off-every-commit)
- Changelogs, in [Changelog entries](CONTRIBUTING.md#changelog-entries)
- Reporting a vulnerability, in [Reporting a vulnerability](SECURITY.md#reporting-a-vulnerability)
- Decision records, in [Decision records](CONTRIBUTING.md#decision-records)
- Writing documentation, in [Documentation](CONTRIBUTING.md#documentation)

## Checking your work

Verify a change to the interface in a browser before calling it done, and report what you measured rather than what you
expect. Run every build and test in the repository before handing work back.
