# 131. Astrana is localised, and each person chooses their locale

Proposed.

## Context

Astrana aims to accommodate as many people as it reasonably can, in different communities all over the world. They
should be able to use it in their own language and script, with dates and numbers in the form they are used to. Even on
one instance, the owner and their guests may not share a first language. Text and formats written into the code would
tie everyone to one language and one way of writing dates and numbers, and separating them out later means changing most
of the interface.

## Decision

Every piece of text Astrana shows or sends to a person, and every date, time and number, follows the locale that person
chooses, their language and region, rather than being written into the code. Text with no translation in their locale's
language appears in British English. Layouts work in both left-to-right and right-to-left scripts.

## Consequences

- Every message is written in British English first, so British English is complete, and every other language is a
  translation of it.
- Text is kept apart from the code as whole messages, so that a translation can reorder a sentence. Text built by
  joining fragments cannot be translated well.
- The project builds its own system for storing translated messages and picking the right one for each language,
  including its plural forms, rather than adopting a translation library (record 4).
- Dates, times and numbers are formatted with the internationalisation support built into the browser and into .NET.
- Layouts leave room for text that runs longer in translation than in British English.
- Layouts are written in terms of start and end rather than left and right, so a right-to-left script mirrors the whole
  layout and not only its text.
- Localisation covers what Astrana itself says. What people write is shown as they wrote it, in its own reading
  direction.
- Building in one language first and adding others later was rejected, because the cost of separating text from code
  grows with every screen written.
