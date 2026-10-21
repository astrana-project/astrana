# 19. The app is a progressive web app served by each instance

Proposed.

## Context

The people using an instance need a way to use it from their phones and computers. A native app reaches people almost
only through a platform's app store. A store decides what may be listed and can remove an app, links each installation
to the person's store account, so it keeps a record of who installed the app and when, charges developers fees and
reviews every release at its discretion. Major stores also typically require apps with user content to provide central
moderation, which fits poorly with software that has no central operator. Some people would rather not install an app at
all.

## Decision

The app people use is a progressive web app, served by the owner's own instance to the people who use it. It works in a
browser, and can be installed on a phone or a computer from the instance itself.

## Consequences

- There is nothing to put in an app store, so no store can refuse or remove Astrana, and installing leaves no record
  with one.
- The app updates when the instance does.
- Installing it needs a certificate the browser trusts for the instance's address, and in practice a domain name.
- The browser can still observe some use, and notifications pass through its push service, which sees when a message
  arrives but not what it says. Which browser to trust is the person's choice.
- Some capabilities depend on installation and on the platform, so the app detects what the platform supports rather
  than assuming it, and says when something is unavailable.
- Native apps distributed through a central store were rejected, because a store would stand as a gatekeeper between an
  owner and the people using their instance.
- A desktop app that only contains the web app was considered and is not planned. If it were pursued, it would likely
  use a cross-platform framework such as .NET Multi-platform App UI (MAUI).
