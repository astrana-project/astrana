# 17. No stored file is ever given permission to run

Proposed.

## Context

Files arrive from the owner and from peers, and scanning catches only malware it already knows
([record 16](0016-every-file-is-scanned-for-malware-when-it-arrives.md)). A malicious file that is never run does no
harm on the instance's own machine.

## Decision

No stored file is ever given permission to run, wherever it is kept.

## Consequences

- A malicious file that scanning missed still cannot run on the instance's machine.
- Quarantine, scanning and the refusal to run anything are separate defences, so a failure in one is not a failure in
  all. None of them protects a person who downloads a file and opens it on their own device.
- Astrana never needs to run a stored file, so the rule costs nothing it uses.
