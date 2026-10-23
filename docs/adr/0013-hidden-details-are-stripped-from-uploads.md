# 13. Hidden details are stripped from uploads

Proposed.

## Context

Files carry details their owner may never see, such as where a photo was taken and which device took it.

## Decision

Hidden details are removed from every copy of an uploaded file that is served or shared. The original keeps them on the
instance, and each part of Astrana sees only as much of a file as it needs. Camera details are the one exception, left
in what is served or shared only if the owner turns them on.

## Consequences

- Location and device identifiers never reach anyone a file is served or shared with.
- Stripping happens whatever the owner intended, because the risk does not depend on intent.
- Rights and licence declarations, the opt-out from artificial intelligence (AI) training and any watermark the owner
  adds travel with the file, because their purpose is to survive.
