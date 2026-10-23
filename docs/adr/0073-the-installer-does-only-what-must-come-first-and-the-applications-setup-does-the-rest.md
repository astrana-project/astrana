# 73. The installer does only what must come first, and the application's setup does the rest

Proposed.

## Context

The installer and the application are separate pieces of software that work closely together, and several steps of
setting up an instance could be done by either one.

## Decision

Installing has two parts with a firm line between them. The installer does only what must happen before the application
can run, which is placing the files, creating the first secrets, setting up the web server in front of it, and starting
the service. The application's own setup then does the rest. It creates or asks for two database credentials, one for
reading and writing data and one for schema migrations, and runs the first schema migrations with the second. It also
sets up the owner's account and where secrets are kept, and asks whether to install troubleshooting telemetry.

## Consequences

- Someone helping an owner can complete an installation without ever holding the owner's sign-in, because the installer
  never creates the owner's account.
- The installer never asks for or stores database credentials.
- The interactive steps happen in the application's own web pages, which are easier to test and to retry than installer
  dialogs.
- Falling back to a default or shared secret when one cannot be created was rejected, because every instance that hit
  that error would then be identical. The install fails instead.
