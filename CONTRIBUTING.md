# Contributing

Every change is made through a pull request, and everyone taking part must follow the
[code of conduct](CODE_OF_CONDUCT.md).

## Before you start

Every change requires a corresponding issue. For a small fix, you can open the issue when you open the pull request. For
anything larger, open the issue first, describe what you intend to change and why, and start once the maintainer agrees
it should be done.

**Never raise a security vulnerability in an issue or a pull request.** Report it privately, as described in
[SECURITY.md](SECURITY.md).

The [quick start guide](docs/quickstart.md) explains how to set up Astrana on your computer, and how to run and test the
applications.

## Make your change

### Branches

Start your work on a branch from `develop`, and open your pull request into `develop`. Name the branch for the kind of
change it makes:

- `feature/` for new or changed behaviour, such as a new feature or an improvement to an existing one
- `fix/` for a defect
- `technical/` for refactoring, tests of existing behaviour, continuous integration (CI), build settings and tooling
- `housekeeping/` for corrections to documentation and wording that do not change their meaning

A housekeeping branch may change only Markdown files, and CI fails a housekeeping pull request that changes anything
else.

The maintainer creates release and support branches. [RELEASING.md](RELEASING.md) describes how they work, including the
version rules for a pull request into one.

### Code

Write code that is easy to understand and maintain. Name things for what they are or do, so that a reader does not need
to open them to find out. Keep each function to one job and short enough to hold in your head, and keep its complexity
low.

Put code where a reader would look for it, and keep the structure the same across similar parts of the codebase. Make
dependencies explicit rather than relying on shared state. Add a comment only where it adds something the code cannot
say. If the reason for something matters beyond the lines next to it, write it in a decision record instead. Remove dead
code and leftover debugging rather than commenting it out.

Start every C#, TypeScript, JavaScript, CSS and PowerShell file with the licence identifier,
`SPDX-License-Identifier: MPL-2.0`, in that language's comment style. It is a legal notice rather than an explanation,
so it is required even where no other comment is. Run `tools/scripts/Add-LicenceLines.ps1` to add it to each of these
files that lacks it. CI fails a pull request if any of these files lacks it. In Visual Studio, the editor snippets in
`tools/snippets/` add it to C#, CSS and XML files.

### Dependencies

Keep third-party dependencies to a minimum. Each one is part of the attack surface of every Astrana instance, and a
vulnerability in one forces a new release. Use what the language, the browser and the framework already provide, and add
a dependency only when it does something they do not. Say in the pull request why it is needed.

When you add or update a dependency, pin its exact version and commit the updated lock file. CI restores from the lock
files and fails when they do not match. Choose a version that has been released for at least seven days, so that a
broken or malicious release has time to be found. Only open source packages may ship in either application. CI fails a
pull request that adds a package with a known high or critical vulnerability.

### The interface

The interface must meet the Web Content Accessibility Guidelines (WCAG) 2.1 at level AA. Never let colour carry meaning
on its own.

Reuse familiar interaction patterns, but never another platform's palette, artwork, icons, names, wording or signature
interactions. In interface text, say peer rather than friend or connection. Load every asset and script in the web app
from its own instance, never from a content delivery network.

### Security and secrets

Do not weaken these rules, which protect each instance's credentials.

- Keep credentials and tokens out of the browser. Let the server own the session, through an `HttpOnly` cookie.
- Never commit the `App_Data/` folder or include it in a release. It is for the server's runtime state, including an
  instance's credentials.

**Never commit a secret.** That means any password, token, private key, client secret or connection string that carries
a password, for any system, your own test accounts included. Keep secrets out of every settings file in the repository.
For local development, put credentials in .NET user secrets or in a file Git ignores.

If you commit a secret by mistake, treat it as exposed, even after you remove it, because it stays in the history.
Revoke or replace it first, and then tell the maintainer. If the secret gives access to anything real, tell them
privately, as described in [SECURITY.md](SECURITY.md).

### Tests

When you change code, add tests that describe what the code does. You may write them before or after the code, as long
as they are finished before you mark the pull request ready for review.

- Give a bug fix a test that reproduces the bug and fails without the fix.
- Change a test only when a decision has changed the behaviour it describes, never just to make it pass.
- Give every unit test its own dependencies, so that no test can affect another.

### Documentation

Write for human readers, in plain British English, and give every sentence something the reader can use. Expand an
acronym the first time it appears in a document, unless it is well known, such as HTTP or JSON.

- Use commas and full stops rather than em dashes or semicolons, and write words in place of "e.g.", "i.e." and "etc.".
- Start a sentence with what it says, not with a label and a colon, such as "Note:". A line ending in a colon that
  introduces a list or a code block is fine.
- Describe things as they are, without status or history notes such as "currently", "no longer" or "was changed".
- Keep planning notes, task lists, commentary about the work and sentences about the document itself out of repository
  documents.
- Point to another document only when the pointer adds something.
- Leave out filler words such as "simply", "by design" and "for now".

### Decision records

Record each decision about how Astrana is designed and built in [docs/adr](docs/adr), one record per decision, beside
the [mission and vision](docs/adr/vision.md) they rest on. Read the records in order. If your change makes a new
decision, or reverses one already recorded, include the record in the same pull request. A change that stays inside an
existing decision, such as a new configuration option, a fix or a dependency update, needs no record.

A record covers one decision that could be reversed on its own. If you find yourself writing two, split them. If what
you are writing could not be reversed without reversing another record, it belongs in that record's consequences.

- Title the record with the decision, in plain words, so that the title alone states what was decided. The file name is
  the title, with the next number in front.
- Start with the status as a sentence. A new record's status is `Proposed.` until the maintainer accepts it, and then
  `Accepted on YYYY-MM-DD.`, dated the day the maintainer accepted it.
- Then Context, Decision and Consequences sections. Context must describe what made the decision necessary. Decision
  must describe what was decided and nothing else. Consequences must describe what follows from it, what it costs and
  what was considered and rejected and why, written as sentences rather than labelled fragments.
- Cite only lower-numbered records. If you need a later one, either the order is wrong or the sentence belongs in the
  later record.
- Do not point to this file, SECURITY.md or the README anywhere in a record.
- Write an HTTP status as its code and name, `HTTP 404 - Not Found`.
- Leave out counts that will change.
- Keep it short. A record that runs past a screen is usually two decisions.
- Follow [Documentation](#documentation), expanding acronyms in each record as if it were a document of its own, and use
  no bold for emphasis.
- Add the record to the index, `docs/adr/README.md`, in the group it belongs to, with the records it derives from. The
  first record creates the index.

To change a decision, write a new record and change the old one's status line to `Superseded by record N on YYYY-MM-DD.`
Never edit a record into a different decision. The old record is the history of why things were as they were.

### Changelog entries

Each application keeps its own changelog, following [Keep a Changelog](https://keepachangelog.com/en/1.1.0/). The
Astrana application's is [application/CHANGELOG.md](application/CHANGELOG.md), and Astrana Owner Tools' is
[owner-tools/CHANGELOG.md](owner-tools/CHANGELOG.md).

Add an entry under `[Unreleased]` whenever your change alters what an application ships. That includes its code, its
dependencies, and the web app's start page, static files and build settings in `vite.config.ts`. Code in `shared/src/`
ships in both applications, and so do the build settings in `global.json` and `Directory.Build.props`, so a change to
any of these needs an entry in both changelogs. Documentation, tests, CI and development tools need no entry. CI checks
this on every pull request.

Put each entry under the heading that fits, such as Added, Changed, Fixed or Security. Write it in the past tense, in a
sentence or two, and say what the change requires of the person running the application. For a dependency update, give
the old and new versions. For a security fix, name the advisory, and credit the reporter unless they prefer not to be
named.

## Commit

### Sign off every commit

The project accepts contributions under the [Developer Certificate of Origin](DCO). By signing off a commit you certify
that you wrote the change or otherwise have the right to submit it under the project's licence, the
[Mozilla Public License 2.0](LICENSE).

```
git commit -s -m "Your message"
```

This adds a `Signed-off-by` line with the name and email address in your Git settings. CI checks that the line matches
the commit's author. If you forget, add the line with `git commit --amend -s` for your last commit, or run `git fetch`
and then `git rebase --signoff` onto the branch your pull request targets, such as `origin/develop`, for every commit on
your branch. Then push with `git push --force-with-lease`.

You may use AI coding assistants, as the maintainer does. Signing off a change means you have reviewed it, you
understand it and you stand behind it, however it was written.

### Format your changes

`dotnet format` formats the .NET projects. Biome formats TypeScript, JavaScript, JSON and CSS, and lints the whole
repository. Prettier formats Markdown and YAML. Run `npm run format` at the root of the repository for Biome and
Prettier, and `dotnet format` on each .NET solution, before you push. The shared settings are in `.editorconfig`,
`biome.json` and `.prettierrc`.

## Open a pull request

A pull request is complete when it has everything below, ready to ship as it stands. Open a draft pull request if you
want early feedback, and mark it ready for review only when it is complete.

- One change.
- A link to its issue. The maintainer will not review a pull request until it links to its issue.
- A short title in the imperative, and a description that states what changed and why. They become the commit message on
  the branch the pull request merges into. To credit an AI coding assistant, end the description with a line that starts
  with `Co-Authored-By:` and names the assistant.
- Tests for every change to code.
- Documentation updated for every change in behaviour.
- A changelog entry, if the change alters what an application ships.
- A decision record for any decision the change makes or reverses.
- Every commit signed off.
- Every file formatted.
- A branch up to date with the branch it targets.
- Every required check passing.

## Get your change reviewed and merged

Only the maintainer merges, and the maintainer reviews every change that is not their own before it merges. The
maintainer squash-merges your pull request, so your branch becomes one commit, with the pull request's title and
description as its message. Your branch commits therefore need no particular message style, only their sign-off.

Only `release/` and `housekeeping/` branches may merge into `master`. CI fails any other pull request into `master`, and
any pull request into `master` from a fork. A housekeeping branch may merge straight into `master` when a correction
cannot wait for the next release.

The [code of conduct](CODE_OF_CONDUCT.md#decisions) sets out how decisions about the project are made and how to
disagree with one.
