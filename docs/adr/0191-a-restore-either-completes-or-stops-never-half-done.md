# 191. A restore either completes or stops, never half done

Proposed.

## Context

Astrana Owner Tools restores an instance from its backups
([record 181](0181-the-instance-makes-scheduled-backups-and-astrana-owner-tools-makes-manual-ones-verifies-and-restores.md)),
and a restore can fail part way, or meet a value the target database refuses to hold.

## Decision

Nothing the instance serves changes until a restore's final step, which swaps the restored data in at once. If a restore
fails or is interrupted before then, what it built is discarded and the instance is left as it was. A row the target
database refuses stops the whole restore, and the owner is told which table and which row failed, and why. Every value
is checked against the target database's rules before anything is loaded.

## Consequences

- An owner never has to guess what survived.
- Checking every value first means nearly every refused row shows within seconds, rather than part way through a restore
  that can take most of an hour.
- Astrana never writes a value its own databases cannot hold, so a refused row comes only from an archive made before
  Astrana's rules on text, a restore into a different database engine, or an archive that is damaged or has been
  tampered with and passed its other checks.
- Keeping the instance unchanged until the final step needs room for the restored data beside the live data.
- After a restore that stops, the instance carries on as it was until its owner acts.
- Restoring what can be restored and reporting the rest was rejected, because an owner cannot tell from a report what is
  missing from their data, and a restore is a last resort, so a half-restored instance is worse than none.
- Skipping a refused row was rejected, because it would break links between records with nobody noticing. Changing a
  value to fit was rejected, because it would alter what somebody wrote and break the checks that detect tampering.
- Each of these trades a finished restore for protection against loss and corruption, which come first.
