# 31. Uploads stop before the disk fills

Proposed.

## Context

An instance with nowhere left to write stops working.

## Decision

Uploads are refused once storage reaches a limit the owner sets, which can never be above 95 per cent of the disk. A
minimum amount of free space, worked out from what the instance needs to run, is always kept.

## Consequences

- Uploads cannot fill the disk and stop the instance.
- The owner is warned at each upload while uploads still work, not by a dashboard they would have to go and check.
