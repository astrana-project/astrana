# 145. All text is normalised to NFC, whatever its source

Proposed.

## Context

The same character can often be written as more than one sequence of code points. An accented letter can be one code
point, or a letter followed by a combining mark, and the two are the same character by Unicode's own definition. A
filter that refuses a character, or a check that two names differ, can be defeated by supplying the other form. The
server normalises input before it checks it ([record 144](0144-the-server-checks-everything-the-app-checks.md)), and
that needs one form chosen for text.

## Decision

All text is normalised to Unicode Normalization Form C (NFC) on arrival, whether a person typed it, a peer sent it, or
an import, a restore or a configuration file carried it. The compatibility forms, Normalization Form KC (NFKC) and
Normalization Form KD (NFKD), are never applied.

## Consequences

- Nothing a person wrote is changed, because the forms NFC unifies are the same character. A circled digit and a
  chemical subscript survive it unchanged.
- Every rule and comparison sees one form of each character, so none of them has to remember to normalise.
- Text is handled in one order everywhere. Any signature or integrity tag is verified first, then the text is
  normalised, then its characters are checked, then its length is counted, and then it is stored. A character check that
  ran before normalising would be judging a sequence about to change, and normalising can change how many code points a
  string holds.
- NFC does nothing about names that look alike, since a Cyrillic letter and its Latin twin are different letters and
  both are already in NFC. Lookalikes need a rule of their own.
- NFKC was rejected because it also folds characters that only look related, turning a superscript two into a two or a
  full-width letter into a narrow one, which loses information and would rewrite mathematics, chemistry and several
  scripts. It is also assumed to defend against lookalike names and does not, because it does not map a Cyrillic letter
  onto its Latin twin.
