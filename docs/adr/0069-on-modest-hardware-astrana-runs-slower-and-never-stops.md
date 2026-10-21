# 69. On modest hardware Astrana runs slower and never stops

Proposed.

## Context

Astrana should run on cheap, modest or secondhand hardware. Malware scanning, image processing, content classification,
audit logging and scheduled tasks all add work in the background.

## Decision

When resources are short, background work takes longer to finish, and is never quietly skipped or switched off.
Background work never makes the interface wait. Where something will take longer than people will tolerate for that kind
of task, the interface shows honest progress.

## Consequences

- A file is never left unscanned because scanning was too slow.
- Slower is acceptable only where the task allows for it. Around one second is the limit for responding to a click, and
  beyond it people experience the product as broken.
- Every future technical choice is weighed against modest hardware, so the software does not quietly come to assume a
  new machine.
- What hardware meets the requirements has not yet been measured.
