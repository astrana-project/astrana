# 3. People use Astrana through a web app served by the instance they use

Proposed.

## Context

The people using an instance need a way to use it from their phones and computers. On a phone, a native app reaches
people almost only through the platform's app store, and even outside it the company behind the phone's operating system
decides which developers' apps may be installed.

A store decides what may be listed and can remove an app. It also links each installation to the person's store
account, so it keeps a record of who installed the app and when, which it can be compelled to hand over. Most stores
charge developers fees and review every release at their discretion, and keeping up with each store's changing
requirements would be continual work for the project. Major stores typically require apps with user content to provide
moderation tools and a way to act on reports, which fits poorly with software that has no central operator.

Some people would rather not install an app at all. A web app served by the instance itself needs no store, and works in
a browser without installing anything.

## Decision

People use Astrana through a web app that each instance serves. The web app can be installed from the instance as a
progressive web app on a phone or a computer. Distributing the instance itself is a separate matter.

## Consequences

- The web app updates when the instance does.
- Installing it needs a trusted certificate for the instance's address, and in practice a domain name. Without one the
  instance still works in a browser, behind a certificate warning, but the web app cannot be installed.
- Installing the web app leaves no record with a store. The browser can still observe some of its use. It may keep its
  own record, depending on its settings, and notifications pass through its push service, which sees when a message
  arrives but not what it says. Which browser to trust is the person's choice.
- Some capabilities depend on installation and on the platform. Notifications on iOS, for example, reach only a web app
  installed to the home screen. The web app detects what the platform supports rather than assuming it, and says when
  something is unavailable.
- Native apps distributed through a central store were rejected, because a store would stand as a gatekeeper between an
  owner and the people using their instance. A native app wrapping the web app was considered and not adopted.
