# 180. Saving shared media is off by default, and the sharer turns it on

Proposed.

## Context

A viewer who saves another person's photo or video gets a file they can edit and pass on, which children in particular
may use to bully others or expose details they do not understand. Nothing can stop a determined viewer copying what they
see ([record 176](0176-what-leaves-an-instance-can-be-kept-by-those-who-receive-it.md)), but the easy ways of saving can
be made harder. Each instance enforces only what it serves
([record 177](0177-each-instance-enforces-only-what-it-serves.md)).

## Decision

Images and videos are protected from saving for every viewer by default. The sharer allows saving explicitly, for an
item, for a container such as a post or an album, or through an account setting that is itself off until turned on. A
guardian decides whether a child's own posts may be saved, and a child viewer is never offered saving. The permission
travels with the item like its audience, set by the sharing instance and honoured by the viewer's, and where it is
absent, saving is off.

## Consequences

- There are ordinary reasons to save, such as printing a photo for a grandparent, and the sharer can allow them.
- A permission that fails to arrive leaves saving off, which is the safe direction.
- Images are shown as backgrounds with dragging turned off, which removes the browser's save option. Every image then
  needs an accessible label to keep the interface's accessibility commitment, tested with real screen readers, and
  Astrana needs its own full-size viewer with zoom and a print style, because browsers do not print backgrounds.
- The protection is friction. Screenshots, frame captures, screen recording and a program running inside the page all
  still work, and the interface says so.
- A viewer's instance that has been modified can ignore the permission.
