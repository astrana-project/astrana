# 165. Owner account recovery runs through a tool on the host machine, after a waiting period

Proposed.

## Context

When an owner has lost their recovery codes and their recovery secret, the last layer of recovery has to prove control
of the host machine ([record 126](0126-a-second-factor-is-required.md)). Asking an owner to edit a configuration value
or clear a database row is a real barrier, and any way back in through the web application would be an attacker's way in
too.

## Decision

Owner account recovery runs through Astrana Owner Tools on the host machine, never through a page in the web
application. The tool asks the operating system to verify the person as an administrator, or on a host machine without a
screen it is run as an administrator at the console or over a remote shell. On shared hosting, Astrana Owner Tools
places a single-use code in the hosting account. Once verified, the tool issues a single-use recovery code for the owner
account, which works only after a waiting period during which it can be cancelled. The wait is twenty-four hours by
default, and the owner may set a longer one in advance, up to a week. Where no channel outside the instance is
available, or sending fails on all of them, the wait is forty-eight hours, or the owner's own setting if longer.

## Consequences

- Whoever controls the host machine can recover the owner account, and the guidance says so plainly.
- Every recovery event notifies the owner through every available channel, and every guardian and custodian, and is
  logged. The notice is also shown inside the instance, so the real owner sees it at their next sign-in.
- The threat the wait answers is close to home, such as a stolen laptop left unlocked, a family member with the
  administrator password or someone with remote access. In that case the real owner is usually not locked out and sees
  the notice at their next sign-in, in time to cancel, which is why a longer wait helps even when no notice can leave
  the instance.
- Once a recovery starts, its wait never shortens, even if a channel starts working.
- Setup and the instance's health status warn when no channel outside the instance would reach the owner.
- For a remote shell, keys held in hardware or protected by a passphrase are recommended, agent forwarding is advised
  against, and unsafe server settings are reported.
- Recovery loses no data, because the keys protecting the owner's data are not derived from the owner's password.
- It applies to the owner account only.
