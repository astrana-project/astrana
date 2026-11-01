# 239. Uninstalling an instance disposes of it

Proposed.

## Context

Someone who uninstalls Astrana usually means to be rid of the instance, and may be about to sell, give away, recycle or
send the machine for repair. An instance left behind on the disk holds the owner's identity and data. Each platform has
its own way to remove software, and the owner should not have to learn a different one for Astrana. Every installation
is performed by Astrana Owner Tools ([record 238](0238-every-installation-is-performed-by-astrana-owner-tools.md)).

## Decision

Uninstalling is treated as intent to dispose. It removes the instance's software, configuration, database and data
files, as soon as it is intended, through one tool of Owner Tools, Astrana Uninstall. Before anything is destroyed it
offers an export and a backup, and copies out media the owner wants to keep. Backups on the same machine are destroyed.
For backups held elsewhere the owner chooses, and the tool lists every destination and what it holds, deletes where it
has the rights, gives step-by-step instructions where it does not, and says plainly that kept backups hold the full
identity.

## Consequences

- Disposal is easy on each platform and follows its own conventions as far as it can.
- A package manager's purge disposes of the instance at once, without telling its peers, because no key is left to sign
  an ending. A warning beforehand says peers will not be told and cannot be told later, and points to the Owner Tools
  command that tells them first. Where someone is at a terminal a countdown runs, cancelled by a key press. Unattended
  runs skip the countdown and keep the warning, which reaches the logs.
- A package manager's plain removal follows the platform's norm. It removes the program, leaves the data encrypted and
  locked, warns that anyone with administrator access could read it, and leaves Owner Tools available so the owner can
  dispose of the instance properly.
- An administrator may turn on a setting that lets an unattended removal dispose of the instance with no countdown. It
  is off by default and documented as not recommended, because disposal cannot be undone.
- An instance that was never set up holds nothing to dispose of, and is removed freely.
- Keeping the data on uninstall unless the owner asks otherwise was rejected, because an instance left on a machine that
  changes hands exposes everything it holds.
