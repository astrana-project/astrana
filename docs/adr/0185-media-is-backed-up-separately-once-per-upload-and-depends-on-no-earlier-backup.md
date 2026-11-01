# 185. Media is backed up separately, once per upload, and depends on no earlier backup

Proposed.

## Context

Media is stored as files ([record 24](0024-media-is-stored-as-files-not-in-the-database.md)). It is usually most of an
instance's size and rarely changes once uploaded, so copying all of it in every backup
([record 181](0181-the-instance-makes-scheduled-backups-and-astrana-owner-tools-makes-manual-ones-verifies-and-restores.md))
would make backups slow and costly, especially from a home connection and on modest hardware. A backup built as a chain
of increments needs every link to restore, so one damaged increment spoils everything after it.

## Decision

Media is backed up apart from the core archive, which holds the configuration, the database and the keys. Each media
item is stored once per destination as an object of its own, and only items not already there are copied. Every core
archive lists the media it needs and is itself a full backup. Media is not deduplicated, so a file uploaded twice is
backed up twice. Each item's backup identifier is derived with a key from the item's own identifier, and its content
hash is used only to check integrity. Database records refer to media by identifier and never by file path. A media copy
is kept while any surviving archive refers to it. A destination has a core area and a media area, which may be in
separate places, each with its own protection and retention. The owner chooses whether media copies are sealed like the
archives or written as plain files.

## Consequences

- The core archive stays small enough to run often, which is what keeps backups affordable on modest hardware.
- There is no chain, so a damaged media file affects only the archives that list it.
- Links survive a restore, because a record names the item and the restored database maps each item to its backup
  object.
- A media file deleted from the instance stays at the destination for as long as an older archive still needs it.
- Media is not compressed again, because images and video arrive compressed already.
- Plain media copies can be opened without Astrana or the recovery secret, and can be read by anyone who reaches the
  destination. Sealed copies cannot be opened without the recovery secret.
- Deduplicating was rejected, because two uploads sharing one stored object would mean deleting one either deleted the
  other's data or kept data past its purpose, each upload has its own audience, expiry and deletion, and keeping links
  to one shared copy correct would be too hard. Naming objects by content hash was rejected for the same reason, since
  it would merge identical uploads.
