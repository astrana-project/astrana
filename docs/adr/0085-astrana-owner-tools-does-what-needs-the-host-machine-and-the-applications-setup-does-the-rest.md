# 85. Astrana Owner Tools does what needs the host machine, and the application's setup does the rest

Proposed.

## Context

An instance is installed through Astrana Owner Tools, which runs on the machine being installed or on the owner's own
computer for a remote one, and is then set up through the application's own setup page. Several steps of setting up an
instance could be done by either one. A browser showing the setup page cannot see the host machine, and the application
never holds administrator rights, while a person's account and passkey belong in the browser at the instance.

## Decision

Installing has two parts with a firm line between them. Astrana Owner Tools does what can only be done from the host
machine or needs its privileges, and the application's setup does everything else. Astrana Owner Tools places the files,
creates and seals the instance's master key, sets up the web server, creates the database accounts and runs the first
schema migrations, starts the service, and ends by opening the setup page. The application's setup creates every user
account, the owner's, a guardian's or a custodian's, and Astrana Owner Tools never creates one.

Each part asks only what it needs, or what is optional but matters so much later that it is better asked early. A
question needed to meet a prerequisite or a legal obligation is asked by Astrana Owner Tools when its answer can be
passed securely to the setup page.

## Consequences

- Someone helping an owner can complete an installation without ever holding the owner's sign-in, because Astrana Owner
  Tools never creates a user account or handles a person's password.
- A passkey is tied to the address the instance is reached at, so it can only be registered in a browser at the
  instance, which keeps every user account in setup.
- Running Astrana Owner Tools again to update or repair an instance never touches user accounts.
- The setup page never takes database credentials or creates database accounts.
- Until setup finishes the instance has no owner, so Astrana Owner Tools opens the setup page as its last step, and the
  gap lasts minutes rather than days.
- Astrana Owner Tools is not a small program, because security requirements and knowledge of the host machine have given
  it real work. It stays as lean as that test allows.
- Falling back to a default or shared secret when one cannot be created was rejected, because every instance that hit
  that error would then be identical. The installation fails instead.
- Drawing the line between interactive and silent steps was rejected, because some questions can only be answered with
  knowledge of the host machine that the setup page cannot gather.
