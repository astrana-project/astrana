# 19. The app is a progressive web app served by each instance, and Astrana builds no native apps

Proposed.

## Context

The people using an instance need a way to use it from their phones and computers. A native app reaches people almost
only through a platform's app store. A store decides what may be listed and can remove an app, links each installation
to the person's store account, so it keeps a record of who installed the app and when, which can be compelled to be
handed over, charges developers fees and reviews every release at its discretion. Major stores also typically require
apps with user content to provide central moderation, which fits poorly with software that has no central operator. Some
people would rather not install an app at all.

## Decision

The app people use is a progressive web app, served by the owner's own instance to the people who use it. It works in a
browser, and can be installed on a phone or a computer from the instance itself. It is the only way people use Astrana.
Astrana builds no native apps, and does not package the web app for any store.

## Consequences

- There is nothing to put in an app store, so no store can refuse or remove Astrana, and installing leaves no record
  with one.
- A native app would make Astrana itself depend on whoever controls its distribution. For the people who reached Astrana
  through a store, the app would be Astrana, so a store removing it would end Astrana for them.
- Astrana Owner Tools, which an owner uses to install and manage an instance, is not how anyone uses Astrana, and is
  outside this decision.
- A browser extension that adds to the web app, such as one that checks the code an instance serves against what was
  released, is not a native app, because Astrana works fully without it.
- The app updates when the instance does.
- A guest's app is served by somebody else's instance, so a guest trusts that owner with the code they run as well as
  with their data, where an owner trusts only themselves. Running an instance of one's own is the stronger position, and
  help text says so.
- Installing it needs a certificate the browser trusts for the instance's address, and in practice a domain name.
  Without one, the instance still works in a browser behind a certificate warning, but the web app cannot be installed.
- The browser can still observe some use, and notifications pass through its push service, which sees when a message
  arrives but not what it says. Which browser to trust is the person's choice.
- Some capabilities depend on installation and on the platform, such as notifications on iOS, which reach only a web app
  installed to the home screen. The app detects what the platform supports rather than assuming it, and says when
  something is unavailable.
- Native apps were rejected outright, through a store or any other way, because each would put a gatekeeper between an
  owner and the people using their instance.
- A desktop app that only contains the web app was rejected, because the web app can already be installed on a computer,
  and a wrapper would be one more thing to build and keep current.
