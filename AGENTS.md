# Agent instructions

These instructions are for every artificial intelligence (AI) coding tool working in this repository. Everything in
[CONTRIBUTING.md](CONTRIBUTING.md) applies to the code and documents you write or edit, so read it before changing
anything.

## The repository

This repository holds the Astrana application: the web app in `frontend/` and the .NET projects in `backend/`. Each
keeps its tests in a `test/` folder beside `src/`. The [layout](README.md#layout) in the README shows where everything
is.

The decision records in `docs/adr/` are the source of truth for how Astrana is built and why, and the
[vision](docs/vision.md) gives the purpose they serve. Where code and an accepted record disagree, the code is wrong, or
the record is superseded by a new one.

## Acting for someone

Commit, push, open a pull request or create an issue only when the person you are working for asks you to. Never delete
a file unless they tell you to. Ask before any major change, such as moving or renaming files, restructuring the
repository, or adding, removing or upgrading a dependency or runtime. When you open a pull request, credit yourself as
[AI coding assistants](CONTRIBUTING.md#ai-coding-assistants) describes.

## Where the rules are

- Working test first, in [Tests](CONTRIBUTING.md#tests)
- Code style, dependencies, accessibility, Astrana's own look and the security rules, in [Code](CONTRIBUTING.md#code)
- Formatting, in [Formatting](CONTRIBUTING.md#formatting)
- Signing off commits, in [Developer Certificate of Origin](CONTRIBUTING.md#developer-certificate-of-origin)
- Changelog and version, in [Changelog and version](CONTRIBUTING.md#changelog-and-version)
- Secrets, in [Secrets](CONTRIBUTING.md#secrets)
- Reporting a vulnerability, in [Reporting a vulnerability](SECURITY.md#reporting-a-vulnerability)
- Decision records, in [Architecture decision records](CONTRIBUTING.md#architecture-decision-records) and the
  [index](docs/adr/README.md)
- Writing documentation, in [Documentation](CONTRIBUTING.md#documentation)

## Checking your work

Verify a change to the interface in a browser before calling it done, and report what you measured rather than what you
expect. Run every build and test in the repository before handing work back.
