# 221. Every source file carries the licence identifier

Proposed.

## Context

Astrana ships under the Mozilla Public License 2.0 ([record 39](0039-only-open-source-components-are-bundled.md)). The
licence expects its notice to be attached to each file, and its published answers recommend a notice in every file and
accept a short form. A file copied out of the repository on its own leaves the repository's licence file behind.

## Decision

Every source file starts with the one-line Software Package Data Exchange (SPDX) identifier for the Mozilla Public
License 2.0, written in that language's comment style. A file that cannot carry a comment is covered by the repository's
licence file. A build check confirms that the line is present.

## Consequences

- The licence travels with any file copied out of the repository on its own.
- The line is a legal notice rather than an explanatory comment, so it is required even in files that carry no other
  comments.
- A machine-readable licence manifest for the repository is optional.
