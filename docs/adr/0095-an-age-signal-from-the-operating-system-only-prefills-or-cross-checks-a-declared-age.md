# 95. An age signal from the operating system only prefills or cross-checks a declared age

Proposed.

## Context

An owner's age is declared, not verified ([record 33](0033-an-owners-age-is-declared-not-verified.md)), and a child's
instance is set up with a guardian taking part ([record 88](0088-a-childs-instance-cannot-exist-without-a-guardian.md)).
Some operating systems offer the age range of the signed-in account, declared rather than verified, and some laws
require operating systems to provide such a range and developers to ask for it. Support differs widely. Some platforms
offer no signal at all, and others document an interface that is not switched on.

## Decision

Where the operating system offers an age range, the installer reads it on that computer and uses it only to prefill or
cross-check the declared date of birth, asking the person to confirm where the two disagree. It never reads a birthday
from the operating system, and sends nothing anywhere. The installer works fully with no signal at all. When it installs
for a child on the computer that will run the instance, it first asks whether the operating system account it is running
under belongs to the guardian or to the child.

## Consequences

- The declaration stays the answer that counts, and a signal never overrides it.
- The path without a signal is the one every installation can take, so it is the one that has to work well.
- A signal describes an account rather than the person at the keyboard, and on a family computer the signed-in account
  may be the child's. Asking whose account it is lets the installer read the signal the right way round.
- The account question does not arise when the installer runs on a different computer from the one that will run the
  instance.
- Parts of an installer can run under different accounts, such as when an administrator approves a standard user's
  installation, and which account the signal then describes has to be established for each platform before it is relied
  on.
