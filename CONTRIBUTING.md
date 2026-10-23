# Contributing

Every change comes in as a pull request. `master` must always be releasable, so a pull request has to be finished before
it merges, ready to ship to owners as it stands. A pull request is not ready if it leaves the changelog, the tests or
the documentation for later. Open a draft pull request if you want early eyes on the work, and mark it ready for review
only when it is complete.

## Keeping master releasable

Versions are cut from `master`, so whatever is on `master` is what a release contains. A release has to be possible
whenever one is needed, most urgently when a security fix must reach owners quickly, so nothing unfinished or partial
merges to `master`, and any commit on it can be released as it stands.

- A change an owner can see or use merges only when it is useful to an owner as it stands, not merely when it works.
- A building block with nothing an owner or anyone else can reach, such as a library a later feature will use, may merge
  on its own once it is complete, tested and documented.
- A feature that is finished but kept back for its announcement stays on its branch until it is to be released.
- Unfinished work is never merged behind a feature flag, because it would ship code nobody can use to every instance and
  widen the attack surface for no benefit.

A large feature can live on its branch for some time. Merge `master` into it often to keep conflicts small, and review
and test its work as a chain of smaller pull requests into the feature's branch, which merges into `master` when the
feature is useful. Astrana is developed in public, so keeping a feature on its branch controls when owners receive it,
not who knows about it.

## Before you start

Every change has an issue. For anything beyond a small fix, open the issue before you start work, and describe what you
intend to change and why. If we agree it should be done, go ahead. The maintainer does not review a pull request until
it links to its issue.

**Never raise a security vulnerability in an issue or a pull request.** Report it privately, as described in
[SECURITY.md](SECURITY.md).

You need Git, Node.js 24 (`.nvmrc`) and the .NET 11 software development kit (`backend/global.json`).

## What a pull request needs

- Make one change per pull request. Link the issue, write a short title in the imperative and write a description that
  says what changed and why. They become the commit message on `master`.
- If you add or change code, add or update the unit tests for it.
- Add a changelog entry, sign off every commit and run the formatters.
- Keep your branch up to date with `master`.
- Every build and test in the repository must pass.

## Code

Write code that is easy to understand and maintain. Name things for what they are or do, so that a reader does not need
to open them to find out. Keep each function to one job and short enough to hold in your head, and keep its complexity
low.

Put code where a reader would look for it, and keep the structure the same across similar parts of the codebase. Make
dependencies explicit rather than reaching for shared state. Let the code and its structure describe themselves. Add a
comment only where it adds something the code cannot say. If the reason for something matters beyond the lines next to
it, write it in an architecture decision record, not in a comment. Remove dead code and leftover debugging rather than
commenting it out.

Keep third-party dependencies to a minimum. Each one is part of the attack surface of every Astrana instance, and a
vulnerability in one means a release. Use what the language, the browser and the framework already provide. Add a
dependency only when it does something they do not, and say in the pull request why it is needed. The
[decision record on dependencies](docs/adr/0004-astrana-depends-on-outside-components-only-where-it-must.md) gives the
reasoning.

The interface must stay accessible to the Web Content Accessibility Guidelines (WCAG) 2.1 at level AA. Colour never
carries meaning on its own.

Astrana's look is its own. Reuse familiar interaction patterns, but never another platform's palette, artwork, icons,
names, wording or signature interactions. Use the vocabulary in the [glossary](docs/glossary.md) for interface text,
such as peer rather than friend or connection.

These rules keep the design secure, so do not weaken them.

- The browser never stores credentials or tokens. The server owns the session through an `HttpOnly` cookie.
- Runtime state under `App_Data/` contains an installation's credentials and is never committed or built into an image.

## Tests

Work test first, always. Before you write or change any code, write the test that describes the behaviour you want, run
it and see it fail for the reason you expect. Then write the smallest code that makes it pass, and tidy the code only
while the tests pass.

- A bug fix starts with a test that reproduces the bug.
- Do not write code that no failing test asked for.
- Do not change a test to make it pass, unless a decision has changed the behaviour it describes.
- Give every unit test its own dependencies, so that no test can affect another.

## Secrets

**Never commit a secret.** That means any password, token, private key, client secret or connection string that carries
a password, for any system, your own test accounts included. The settings files contain none, the development settings
included. For local development, put credentials in .NET user secrets or in a file Git ignores.

If you commit a secret by mistake, treat it as exposed, even after you remove it, because it stays in the history.
Revoke or replace it first. Then tell the maintainer. If the secret gives access to anything real, tell them privately,
as [SECURITY.md](SECURITY.md) describes.

## Documentation

Write for human readers, in plain British English. Expand an acronym the first time it appears in a document.

- Do not use em-dashes or semicolons, and do not write "e.g.", "i.e." or "etc.".
- Do not front a sentence with a label and a colon, such as "Note:". A line ending in a colon that introduces a list or
  a code block is fine.
- Do not write sentences about the document itself, or point to something described elsewhere without adding anything.
- Do not add status or history notes, such as "currently", "no longer" or "was changed".
- Do not put planning notes, task lists or commentary about the work into repository documents.

Leave out filler words such as "deliberately", "simply", "by design" and "for now". Every sentence should give the
reader something they can use.

## Architecture decision records

The decisions behind Astrana are in [docs/adr](docs/adr), one record per decision, read in order. They are the source of
truth for what they decide, and the [vision](docs/vision.md) gives the purpose they serve. If your change makes a
decision the index would have to list, or reverses one it already lists, include the record in the same pull request. A
change that stays inside an existing decision, such as a new configuration option, a fix or a dependency update, needs
no record.

A decision record covers one decision that could be reversed on its own. If you find yourself writing two, split them.
If what you are writing could not be reversed without reversing another record, it belongs in that record's
consequences.

- Title the record with the decision, in plain words, so that the title alone says what was decided. The file name is
  the title, with the next number in front.
- Start with the status as a sentence, `Accepted on YYYY-MM-DD.`, dated the day the decision was made.
- Then Context, Decision and Consequences sections. Context must describe what made the decision necessary. Decision
  must describe what was decided and nothing else. Consequences describe what follows from it, what it costs and what
  was considered and rejected and why, written as sentences rather than labelled fragments.
- Cite only lower-numbered records. If you need a later one, either the order is wrong or the sentence belongs in the
  later record.
- Do not point to this file, SECURITY.md or the README anywhere in a record.
- Write an HTTP status as its code and name, `HTTP 404 - Not Found`.
- Leave out counts that will change.
- Keep it short. A record that runs past a screen is usually two decisions.
- Add it to the index in the group it belongs to, with the records it derives from.

To change a decision, write a new record and change the old one's status line to `Superseded by record N on YYYY-MM-DD.`
Never edit a record into a different decision. The old record is the history of why things were as they were.

Write records as [Documentation](#documentation) describes, treating each record as its own document for acronyms, and
use no bold for emphasis.

## Review and merging

Only the maintainer merges. Every change that is not the maintainer's own is reviewed by the maintainer before it
merges.

Pull requests are squash-merged. Your branch becomes one commit on `master`, and its intermediate commits do not reach
`master`. Your branch commits need no particular message style, because nothing reads them apart from the sign-off line.
The pull request title and description are what survive, and the changelog is written by hand rather than generated from
commits.

The [code of conduct](CODE_OF_CONDUCT.md#decisions) sets out how decisions about the project are made and how to
disagree with one.

## Changelog and version

[CHANGELOG.md](CHANGELOG.md) follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/). Add your entry under
`[Unreleased]`.

Documentation, tests, development configuration and build files that never ship need no changelog entry.

## Developer Certificate of Origin

Contributions are accepted under the [Developer Certificate of Origin](DCO). By signing off a commit you certify that
you wrote the change or otherwise have the right to submit it under the project's licence, the
[Mozilla Public License 2.0](LICENSE). Sign off every commit:

```
git commit -s -m "Your message"
```

This adds a `Signed-off-by` line matching the commit author. If you forget, amend or rebase to add it and push again.

## AI coding assistants

This project is developed with AI coding assistants, and the maintainer reviews everything they produce. You may use
them too. Signing off a change means you have reviewed it, you understand it and you stand behind it, however it was
written.

To credit an assistant, add a `Co-Authored-By` line naming it to the pull request description. Pull requests are
squash-merged, so a line in a branch commit does not reach `master`, and the description does.

## Formatting

Format code before you push, with the formatter its toolchain provides: `dotnet format` for the .NET projects and
Prettier for the web apps, Markdown, JSON and YAML. The shared settings are in `.editorconfig`, `backend/.editorconfig`
and `.prettierrc`.
