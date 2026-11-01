# 125. Translations are untrusted input, checked automatically, with security-critical text reviewed

Proposed.

## Context

Translations are data the application reads
([record 70](0070-rules-that-may-vary-live-in-data-and-fixed-rules-live-in-code.md)), written by volunteers the project
does not know, and the project cannot review translations in languages its maintainers do not read. A translation is
text from a stranger that the interface will show to every person who chooses that language.

## Decision

Translations are treated as untrusted input. Automated checks confirm that every translated message keeps exactly the
placeholders and tags of the original. Changes to text that is critical to
security, such as security prompts and recovery steps, are approved by trusted reviewers before they ship. A language
pack is verified by its signature, so an owner knows what they installed. The quality of other text is not reviewed.

## Consequences

- A translation cannot add markup, links or placeholders the original does not have, whoever wrote it.
- A malicious translation of security-critical text, such as one that swaps the meaning of buttons in a security prompt
  or asks for recovery codes, has to pass a reviewer as well as the checks.
- A poor translation of other text is a visible annoyance that can be corrected.
- Security-critical text needs a trusted reviewer who reads each language it is translated into.
- The signature says where a pack came from, not that what it says is true, and Astrana does not claim a review of
  ordinary text it could not carry out.
- Cleaning a translation and inserting it as markup was rejected, because only the interface's own code produces markup.
