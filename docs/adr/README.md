# Architecture decision records for the Astrana application

Why the Astrana application is built the way it is, one decision per record. All of them rest on one premise, that the
individual is the basic unit of society, so a person runs their own instance of Astrana and connects it directly to the
instances of people they already know, with no company between them.

A decision gets a record when it is architecturally significant, meaning it affects the structure of the software, its
qualities such as security, reliability or performance, what it depends on, its interfaces, or the way it is built. Each
record addresses one decision that could be reversed on its own, stands on its own, and is written in plain language.

These records are the source of truth for the decisions they hold. Other documents may refer to a record, but none owns
one or decides what it says, and where another document and a record disagree, the other document is corrected.

A record starts as `Proposed.` and becomes `Accepted on YYYY-MM-DD.` when the maintainer accepts it. Records are
numbered with the most foundational first, so every decision comes after the decisions it rests on, and a record cites
only lower-numbered records. While a record is proposed, its number may change as records are added. Once a record is
accepted its number is fixed, and a later record takes the next number.

A record is never edited into a different decision. Corrections that keep the decision the same are made in place. A
decision that changes gets a new record, and the old record's status becomes `Superseded by record N on YYYY-MM-DD.` The
old record is the history of why things were as they were.

The records below are grouped by topic. The "Derives from" column names the records each record rests on, whether or not
its text cites them.

## The instance and its owner

| Record                                                                                                                                                        | Status   | Derives from |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------------ |
| [1. Each instance has one owner, who is its sole administrator](0001-each-instance-has-one-owner-who-is-its-sole-administrator.md)                            | Proposed | the premise  |
| [20. Astrana is built on one instance per person, running as one live copy](0020-astrana-is-built-on-one-instance-per-person-running-as-one-live-copy.md)     | Proposed | 1            |
| [24. Usernames are unique only within an instance](0024-usernames-are-unique-only-within-an-instance.md)                                                      | Proposed | the premise  |
| [31. Every instance is managed by its owner, and nobody else operates it](0031-every-instance-is-managed-by-its-owner-and-nobody-else-operates-it.md)         | Proposed | 1            |
| [40. There are four kinds of account, and no others](0040-there-are-four-kinds-of-account-and-no-others.md)                                                   | Proposed | 1            |
| [59. An instance may run on the owner's own hardware or on hosting they rent](0059-an-instance-may-run-on-the-owners-own-hardware-or-on-hosting-they-rent.md) | Proposed | 31           |
| [70. There is no sign-up anywhere](0070-there-is-no-sign-up-anywhere.md)                                                                                      | Proposed | 40           |
| [71. An account gets only what its role needs, settled in advance](0071-an-account-gets-only-what-its-role-needs-settled-in-advance.md)                       | Proposed | 40           |
| [107. A guest sees their host's content and can create nothing](0107-a-guest-sees-their-hosts-content-and-can-create-nothing.md)                              | Proposed | 71           |

## Peers and connections

| Record                                                                                                                                                                     | Status   | Derives from |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------------ |
| [2. Connections are mutual, and nobody follows anyone](0002-connections-are-mutual-and-nobody-follows-anyone.md)                                                           | Proposed | the premise  |
| [32. A connection reaches only the two people in it](0032-a-connection-reaches-only-the-two-people-in-it.md)                                                               | Proposed | 2            |
| [33. There are no groups](0033-there-are-no-groups.md)                                                                                                                     | Proposed | 2            |
| [34. Peers recognise each other by keys remembered when they first connect](0034-peers-recognise-each-other-by-keys-remembered-when-they-first-connect.md)                 | Proposed | 2            |
| [44. A request to a peer is a request, never a demand](0044-a-request-to-a-peer-is-a-request-never-a-demand.md)                                                            | Proposed | 2            |
| [53. A profile is seen only after connecting](0053-a-profile-is-seen-only-after-connecting.md)                                                                             | Proposed | 2            |
| [54. Signals about a peer inform the owner and never act by themselves](0054-signals-about-a-peer-inform-the-owner-and-never-act-by-themselves.md)                         | Proposed | 2            |
| [57. Attestation from an organisation is always optional](0057-attestation-from-an-organisation-is-always-optional.md)                                                     | Proposed | 2            |
| [58. A former peer learns of a disconnection when they next ask](0058-a-former-peer-learns-of-a-disconnection-when-they-next-ask.md)                                       | Proposed | 2            |
| [60. Two people confirm a short code before their instances connect](0060-two-people-confirm-a-short-code-before-their-instances-connect.md)                               | Proposed | 34           |
| [61. Peers authenticate each other with a Noise handshake inside HTTPS](0061-peers-authenticate-each-other-with-a-noise-handshake-inside-https.md)                         | Proposed | 34, 60       |
| [62. Peers talk directly over HTTPS, with a WebSocket channel for notifications](0062-peers-talk-directly-over-https-with-a-websocket-channel-for-notifications.md)        | Proposed | 2, 34, 61    |
| [83. An instance tells its peers whether it is under guardianship or custodianship](0083-an-instance-tells-its-peers-whether-it-is-under-guardianship-or-custodianship.md) | Proposed | 40           |
| [86. Access is enforced by the instance that holds the content](0086-access-is-enforced-by-the-instance-that-holds-the-content.md)                                         | Proposed | 43           |
| [87. A refusal looks the same as finding nothing or not being reached](0087-a-refusal-looks-the-same-as-finding-nothing-or-not-being-reached.md)                           | Proposed | 44           |
| [91. Peers see a name, sex and age bracket, never a date of birth](0091-peers-see-a-name-sex-and-age-bracket-never-a-date-of-birth.md)                                     | Proposed | 53           |
| [93. There is no reputation system](0093-there-is-no-reputation-system.md)                                                                                                 | Proposed | 9, 54        |
| [94. Search covers one instance at a time](0094-search-covers-one-instance-at-a-time.md)                                                                                   | Proposed | 44           |
| [95. An instance never keeps a copy of a peer's content](0095-an-instance-never-keeps-a-copy-of-a-peers-content.md)                                                        | Proposed | 2, 62        |
| [116. Peers check what each other can do, not which version they run](0116-peers-check-what-each-other-can-do-not-which-version-they-run.md)                               | Proposed | 62           |
| [125. What leaves an instance can be kept by those who receive it](0125-what-leaves-an-instance-can-be-kept-by-those-who-receive-it.md)                                    | Proposed | 37, 95       |

## Content

| Record                                                                                                                                                                          | Status   | Derives from |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------------ |
| [5. Content belongs to the person who created it](0005-content-belongs-to-the-person-who-created-it.md)                                                                         | Proposed | the premise  |
| [6. Content expires by default](0006-content-expires-by-default.md)                                                                                                             | Proposed | the premise  |
| [7. An edit makes a new version, and earlier versions stay visible](0007-an-edit-makes-a-new-version-and-earlier-versions-stay-visible.md)                                      | Proposed | the premise  |
| [8. A post is a container, and what it holds shares its audience and its life](0008-a-post-is-a-container-and-what-it-holds-shares-its-audience-and-its-life.md)                | Proposed | the premise  |
| [13. Hidden details are stripped from uploads](0013-hidden-details-are-stripped-from-uploads.md)                                                                                | Proposed | the premise  |
| [21. Originals are kept untouched, and copies made from them are what is served](0021-originals-are-kept-untouched-and-copies-made-from-them-are-what-is-served.md)             | Proposed | the premise  |
| [22. Media is stored as files, not in the database](0022-media-is-stored-as-files-not-in-the-database.md)                                                                       | Proposed | the premise  |
| [23. Comments have one level of replies](0023-comments-have-one-level-of-replies.md)                                                                                            | Proposed | the premise  |
| [27. Astrana does not analyse what content depicts or means](0027-astrana-does-not-analyse-what-content-depicts-or-means.md)                                                    | Proposed | the premise  |
| [28. Links are checked against a list held on the instance, never by sending them out](0028-links-are-checked-against-a-list-held-on-the-instance-never-by-sending-them-out.md) | Proposed | the premise  |
| [37. The owner of an instance may remove anything stored on it](0037-the-owner-of-an-instance-may-remove-anything-stored-on-it.md)                                              | Proposed | 1, 5         |
| [43. The owner chooses who each post is for](0043-the-owner-chooses-who-each-post-is-for.md)                                                                                    | Proposed | 2            |
| [48. Files may be kept with an external storage provider](0048-files-may-be-kept-with-an-external-storage-provider.md)                                                          | Proposed | 22           |
| [49. A post that cannot save its attachments is refused, not queued](0049-a-post-that-cannot-save-its-attachments-is-refused-not-queued.md)                                     | Proposed | 8            |
| [50. Albums exist on their own, and posts refer to them](0050-albums-exist-on-their-own-and-posts-refer-to-them.md)                                                             | Proposed | 8            |
| [51. A location is chosen, never read from the device](0051-a-location-is-chosen-never-read-from-the-device.md)                                                                 | Proposed | 8, 13        |
| [52. Content is classified again with every edit](0052-content-is-classified-again-with-every-edit.md)                                                                          | Proposed | 7            |
| [56. A link warning informs, and never blocks](0056-a-link-warning-informs-and-never-blocks.md)                                                                                 | Proposed | 28           |
| [90. Resharing something publishes it anew, to the resharer's own audience](0090-resharing-something-publishes-it-anew-to-the-resharers-own-audience.md)                        | Proposed | 32, 43       |
| [92. A report goes to the owner of the instance, never to the project](0092-a-report-goes-to-the-owner-of-the-instance-never-to-the-project.md)                                 | Proposed | 37           |
| [97. Astrana has no direct messaging](0097-astrana-has-no-direct-messaging.md)                                                                                                  | Proposed | 63           |
| [113. What someone searches for is not kept](0113-what-someone-searches-for-is-not-kept.md)                                                                                     | Proposed | 94           |
| [114. A link to content grants no access](0114-a-link-to-content-grants-no-access.md)                                                                                           | Proposed | 86           |

## The feed and attention

| Record                                                                                                                                            | Status   | Derives from |
| ------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------------ |
| [15. Empty, unmet and failed are shown as three different states](0015-empty-unmet-and-failed-are-shown-as-three-different-states.md)             | Proposed | 2            |
| [16. Mistakes can be corrected](0016-mistakes-can-be-corrected.md)                                                                                | Proposed | the premise  |
| [18. The feed is chronological and never ranked](0018-the-feed-is-chronological-and-never-ranked.md)                                              | Proposed | the premise  |
| [25. Usage tracking belongs to the person it describes](0025-usage-tracking-belongs-to-the-person-it-describes.md)                                | Proposed | the premise  |
| [39. The feed loads a page at a time and says when there is no more](0039-the-feed-loads-a-page-at-a-time-and-says-when-there-is-no-more.md)      | Proposed | 18           |
| [46. Notifications travel by Web Push, with email only as a supplement](0046-notifications-travel-by-web-push-with-email-only-as-a-supplement.md) | Proposed | 19           |
| [47. No engagement count is presented as an achievement](0047-no-engagement-count-is-presented-as-an-achievement.md)                              | Proposed | 18           |
| [89. Every interruption counts as a cost](0089-every-interruption-counts-as-a-cost.md)                                                            | Proposed | 46           |

## Children and guardians

| Record                                                                                                                                                                                                        | Status   | Derives from |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------------ |
| [30. When a child owns an instance, a parent or guardian holds authority over its parental controls](0030-when-a-child-owns-an-instance-a-parent-or-guardian-holds-authority-over-its-parental-controls.md)   | Proposed | 1            |
| [41. A child can own an instance, and age is declared rather than verified](0041-a-child-can-own-an-instance-and-age-is-declared-rather-than-verified.md)                                                     | Proposed | 1            |
| [72. A child's instance cannot exist without a guardian](0072-a-childs-instance-cannot-exist-without-a-guardian.md)                                                                                           | Proposed | 30, 41       |
| [73. Several guardians may hold equal authority](0073-several-guardians-may-hold-equal-authority.md)                                                                                                          | Proposed | 30           |
| [74. A guardian signs in with an account of their own](0074-a-guardian-signs-in-with-an-account-of-their-own.md)                                                                                              | Proposed | 30           |
| [75. A child cannot remove their guardian](0075-a-child-cannot-remove-their-guardian.md)                                                                                                                      | Proposed | 30           |
| [76. A guardian sees who a child talks to and how often, not what they say](0076-a-guardian-sees-who-a-child-talks-to-and-how-often-not-what-they-say.md)                                                     | Proposed | 30           |
| [77. A child can always see their guardian's oversight](0077-a-child-can-always-see-their-guardians-oversight.md)                                                                                             | Proposed | 30           |
| [78. Guardianship is declared, not verified](0078-guardianship-is-declared-not-verified.md)                                                                                                                   | Proposed | 30, 41       |
| [79. At Coming of Age, a guardian's authority ends completely and automatically](0079-at-coming-of-age-a-guardians-authority-ends-completely-and-automatically.md)                                            | Proposed | 30           |
| [80. Restrictions ease in stages, and a guardian may bring a stage forward but never back](0080-restrictions-ease-in-stages-and-a-guardian-may-bring-a-stage-forward-but-never-back.md)                       | Proposed | 30           |
| [81. A child's instance starts with protections already on](0081-a-childs-instance-starts-with-protections-already-on.md)                                                                                     | Proposed | 30, 41       |
| [82. Parental controls apply only to children](0082-parental-controls-apply-only-to-children.md)                                                                                                              | Proposed | 30           |
| [121. Coming of Age follows the age of majority where the owner lives](0121-coming-of-age-follows-the-age-of-majority-where-the-owner-lives.md)                                                               | Proposed | 79, 108      |
| [122. Below the age of digital consent, sending anything beyond the instance is the guardian's choice](0122-below-the-age-of-digital-consent-sending-anything-beyond-the-instance-is-the-guardians-choice.md) | Proposed | 30, 108      |

## Jurisdiction

| Record                                                                                                                                                                                         | Status   | Derives from |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------------ |
| [42. The owner declares where they live](0042-the-owner-declares-where-they-live.md)                                                                                                           | Proposed | 1            |
| [84. Jurisdiction informs and never enforces](0084-jurisdiction-informs-and-never-enforces.md)                                                                                                 | Proposed | 42           |
| [85. Jurisdiction never leaves the instance](0085-jurisdiction-never-leaves-the-instance.md)                                                                                                   | Proposed | 42           |
| [108. A jurisdiction selects a small set of values, not special behaviour](0108-a-jurisdiction-selects-a-small-set-of-values-not-special-behaviour.md)                                         | Proposed | 42, 63, 64   |
| [120. An owner may decline to say where they live, and then gets the most protective defaults](0120-an-owner-may-decline-to-say-where-they-live-and-then-gets-the-most-protective-defaults.md) | Proposed | 108          |
| [124. Language changes how things are shown, not what counts as sensitive](0124-language-changes-how-things-are-shown-not-what-counts-as-sensitive.md)                                         | Proposed | 108, 115     |

## Security and privacy

| Record                                                                                                                                                                                       | Status   | Derives from |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------------ |
| [9. Every material action is logged, and the log never copies content](0009-every-material-action-is-logged-and-the-log-never-copies-content.md)                                             | Proposed | the premise  |
| [10. Telemetry is for troubleshooting only, and a default installation does not contain it](0010-telemetry-is-for-troubleshooting-only-and-a-default-installation-does-not-contain-it.md)    | Proposed | the premise  |
| [11. An instance shows nothing to anyone it has no relationship with](0011-an-instance-shows-nothing-to-anyone-it-has-no-relationship-with.md)                                               | Proposed | the premise  |
| [12. When fetching from other websites, every instance looks the same](0012-when-fetching-from-other-websites-every-instance-looks-the-same.md)                                              | Proposed | the premise  |
| [14. When a protection cannot be applied, the instance holds back rather than going ahead](0014-when-a-protection-cannot-be-applied-the-instance-holds-back-rather-than-going-ahead.md)      | Proposed | the premise  |
| [17. Every file is scanned for malware when it arrives](0017-every-file-is-scanned-for-malware-when-it-arrives.md)                                                                           | Proposed | the premise  |
| [38. The audit log is pruned, not kept forever](0038-the-audit-log-is-pruned-not-kept-forever.md)                                                                                            | Proposed | 9            |
| [45. Application logs are kept apart from the audit log](0045-application-logs-are-kept-apart-from-the-audit-log.md)                                                                         | Proposed | 9            |
| [68. People sign in to the instance itself](0068-people-sign-in-to-the-instance-itself.md)                                                                                                   | Proposed | 1, 31        |
| [98. Content is cleaned when it comes in and encoded when it is shown](0098-content-is-cleaned-when-it-comes-in-and-encoded-when-it-is-shown.md)                                             | Proposed | 2, 62        |
| [99. The database is encrypted at rest](0099-the-database-is-encrypted-at-rest.md)                                                                                                           | Proposed | 65           |
| [101. A second factor is required](0101-a-second-factor-is-required.md)                                                                                                                      | Proposed | 68           |
| [102. Apps acting for the owner use a narrow form of OAuth 2.1](0102-apps-acting-for-the-owner-use-a-narrow-form-of-oauth-2-1.md)                                                            | Proposed | 68           |
| [103. Until setup is finished, the setup page answers only on the host machine](0103-until-setup-is-finished-the-setup-page-answers-only-on-the-host-machine.md)                             | Proposed | 69           |
| [112. A sign-in from somewhere unfamiliar is reported to the owner, as reliably as it can be](0112-a-sign-in-from-somewhere-unfamiliar-is-reported-to-the-owner-as-reliably-as-it-can-be.md) | Proposed | 46, 68       |
| [117. The server checks everything the app checks](0117-the-server-checks-everything-the-app-checks.md)                                                                                      | Proposed | 98, 116      |
| [118. The identity, database and backup keys are independent](0118-the-identity-database-and-backup-keys-are-independent.md)                                                                 | Proposed | 34, 99       |
| [119. Passkeys are the preferred second factor](0119-passkeys-are-the-preferred-second-factor.md)                                                                                            | Proposed | 101          |

## Data and dependencies

| Record                                                                                                                                      | Status   | Derives from |
| ------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------------ |
| [3. Times are recorded in UTC](0003-times-are-recorded-in-utc.md)                                                                           | Proposed | the premise  |
| [4. Astrana depends on outside components only where it must](0004-astrana-depends-on-outside-components-only-where-it-must.md)             | Proposed | the premise  |
| [35. Only open-source components are bundled](0035-only-open-source-components-are-bundled.md)                                              | Proposed | 1, 4         |
| [36. All data access goes through Entity Framework Core](0036-all-data-access-goes-through-entity-framework-core.md)                        | Proposed | 4            |
| [64. Rules that may vary live in data, and fixed rules live in code](0064-rules-that-may-vary-live-in-data-and-fixed-rules-live-in-code.md) | Proposed | 31           |
| [65. The owner chooses PostgreSQL, MySQL or Microsoft SQL Server](0065-the-owner-chooses-postgresql-mysql-or-microsoft-sql-server.md)       | Proposed | 31, 35, 36   |

## Hosting and running

| Record                                                                                                                                                                                       | Status   | Derives from |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------------ |
| [26. All scheduled work runs through one scheduler](0026-all-scheduled-work-runs-through-one-scheduler.md)                                                                                   | Proposed | the premise  |
| [29. Uploads stop before the disk fills](0029-uploads-stop-before-the-disk-fills.md)                                                                                                         | Proposed | the premise  |
| [55. After a gap, the scheduler does what still needs doing, not everything it missed](0055-after-a-gap-the-scheduler-does-what-still-needs-doing-not-everything-it-missed.md)               | Proposed | 26           |
| [66. On modest hardware Astrana runs slower and never stops](0066-on-modest-hardware-astrana-runs-slower-and-never-stops.md)                                                                 | Proposed | 31           |
| [69. The installer does only what must come first, and the application's setup does the rest](0069-the-installer-does-only-what-must-come-first-and-the-applications-setup-does-the-rest.md) | Proposed | 1, 31        |
| [88. The owner supplies the web server in front of the instance](0088-the-owner-supplies-the-web-server-in-front-of-the-instance.md)                                                         | Proposed | 31, 61       |
| [109. What an instance finds about its host is told to its owner, and nobody else](0109-what-an-instance-finds-about-its-host-is-told-to-its-owner-and-nobody-else.md)                       | Proposed | 59           |
| [110. The host must protect data and receive security fixes, however it does so](0110-the-host-must-protect-data-and-receive-security-fixes-however-it-does-so.md)                           | Proposed | 59           |
| [111. Phones are not pursued as hosts](0111-phones-are-not-pursued-as-hosts.md)                                                                                                              | Proposed | 59           |
| [123. An instance checks what it can about its host, rather than asking the owner](0123-an-instance-checks-what-it-can-about-its-host-rather-than-asking-the-owner.md)                       | Proposed | 109          |

## Versions, updates and modules

| Record                                                                                                                                                                        | Status   | Derives from |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------------ |
| [63. Information about versions comes from one central, signed catalogue](0063-information-about-versions-comes-from-one-central-signed-catalogue.md)                         | Proposed | 31           |
| [67. Email is sent through small, replaceable modules](0067-email-is-sent-through-small-replaceable-modules.md)                                                               | Proposed | 35           |
| [96. The project's primary maintainer holds the key that signs the version catalogue](0096-the-projects-primary-maintainer-holds-the-key-that-signs-the-version-catalogue.md) | Proposed | 63           |
| [100. Astrana builds and signs every email module it ships](0100-astrana-builds-and-signs-every-email-module-it-ships.md)                                                     | Proposed | 67           |
| [104. An update is never applied without the owner](0104-an-update-is-never-applied-without-the-owner.md)                                                                     | Proposed | 63           |
| [105. Each instance decides for itself whether it is early in a staged rollout](0105-each-instance-decides-for-itself-whether-it-is-early-in-a-staged-rollout.md)             | Proposed | 63           |
| [106. Nothing can change an instance's behaviour remotely](0106-nothing-can-change-an-instances-behaviour-remotely.md)                                                        | Proposed | 63           |
| [115. Language packs are signed, not reviewed](0115-language-packs-are-signed-not-reviewed.md)                                                                                | Proposed | 64           |

## Backup and moving an instance

| Record                                                                                                                                                                                       | Status   | Derives from |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------------ |
| [126. An instance backs itself up into an encrypted archive](0126-an-instance-backs-itself-up-into-an-encrypted-archive.md)                                                                  | Proposed | 118          |
| [127. A backup is built and checked on the instance's own machine before it is sent anywhere](0127-a-backup-is-built-and-checked-on-the-instances-own-machine-before-it-is-sent-anywhere.md) | Proposed | 126          |
| [128. Moving an instance is a move, not a copy](0128-moving-an-instance-is-a-move-not-a-copy.md)                                                                                             | Proposed | 126          |
| [129. A restore either completes or stops, never half done](0129-a-restore-either-completes-or-stops-never-half-done.md)                                                                     | Proposed | 126          |
| [130. A backup restores into the same or a newer version, never an older one](0130-a-backup-restores-into-the-same-or-a-newer-version-never-an-older-one.md)                                 | Proposed | 126          |

## The web app

| Record                                                                                                                                                                        | Status   | Derives from         |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | -------------------- |
| [19. The app is a progressive web app served by each instance](0019-the-app-is-a-progressive-web-app-served-by-each-instance.md)                                              | Proposed | the premise          |
| [131. Astrana is localised, and each person chooses their locale](0131-astrana-is-localised-and-each-person-chooses-their-locale.md)                                          | Proposed | 4                    |
| [132. The interface meets WCAG 2.1 at level AA](0132-the-interface-meets-wcag-2-1-at-level-aa.md)                                                                             | Proposed | 131                  |
| [133. The interface is responsive and designed mobile first](0133-the-interface-is-responsive-and-designed-mobile-first.md)                                                   | Proposed | 19, 131, 132         |
| [134. Colours, spacing and typography come from design tokens](0134-colours-spacing-and-typography-come-from-design-tokens.md)                                                | Proposed | 131                  |
| [135. The frontend loads assets and dependencies only from its own instance](0135-the-frontend-loads-assets-and-dependencies-only-from-its-own-instance.md)                   | Proposed | 19, 117              |
| [136. Every page carries a Content Security Policy that allows only its own instance](0136-every-page-carries-a-content-security-policy-that-allows-only-its-own-instance.md) | Proposed | 98, 117, 135         |
| [137. Only the interface's own code produces markup](0137-only-the-interfaces-own-code-produces-markup.md)                                                                    | Proposed | 117, 136             |
| [138. The browser never holds credentials or tokens](0138-the-browser-never-holds-credentials-or-tokens.md)                                                                   | Proposed | 136                  |
| [139. The interface stays fast on low-specification hardware](0139-the-interface-stays-fast-on-low-specification-hardware.md)                                                 | Proposed | 4                    |
| [142. The frontend is built with React, in functional style](0142-the-frontend-is-built-with-react-in-functional-style.md)                                                    | Proposed | 4, 19, 136, 137, 139 |
| [143. The frontend is written in TypeScript with strict checking](0143-the-frontend-is-written-in-typescript-with-strict-checking.md)                                         | Proposed | 117                  |

## How the repository is built

| Record                                                                                                                                                        | Status   | Derives from           |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ---------------------- |
| [140. The backend is built on .NET](0140-the-backend-is-built-on-net.md)                                                                                      | Proposed | 4, 35                  |
| [141. Develop on .NET 11 and release on .NET 12 long-term support](0141-develop-on-net-11-and-release-on-net-12-long-term-support.md)                         | Proposed | 4                      |
| [144. One repository, with a frontend and a backend](0144-one-repository-with-a-frontend-and-a-backend.md)                                                    | Proposed | 4                      |
| [145. Tests live apart from the code they test](0145-tests-live-apart-from-the-code-they-test.md)                                                             | Proposed | 144                    |
| [146. Every dependency version is pinned in a committed lock file](0146-every-dependency-version-is-pinned-in-a-committed-lock-file.md)                       | Proposed | 144                    |
| [147. Each release lists everything it ships in a software bill of materials](0147-each-release-lists-everything-it-ships-in-a-software-bill-of-materials.md) | Proposed | 35, 146                |
| [156. The domain is a project of its own in the backend](0156-the-domain-is-a-project-of-its-own-in-the-backend.md)                                           | Proposed | 36, 144, 145, 151, 155 |
| [159. Self-contained builds for Linux, Windows and macOS](0159-self-contained-builds-for-linux-windows-and-macos.md)                                          | Proposed | 1, 66, 104, 141, 146   |
| [163. Architecture rules are checked by tests](0163-architecture-rules-are-checked-by-tests.md)                                                               | Proposed | 4, 151, 155, 156       |

## Architecture

| Record                                                                                                                                                                | Status   | Derives from                      |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | --------------------------------- |
| [150. The architecture follows named principles, not one methodology](0150-the-architecture-follows-named-principles-not-one-methodology.md)                          | Proposed | 4                                 |
| [151. Depend in the direction of stability](0151-depend-in-the-direction-of-stability.md)                                                                             | Proposed | 116                               |
| [152. Internal and external boundaries are treated differently](0152-internal-and-external-boundaries-are-treated-differently.md)                                     | Proposed | 36, 95, 98, 117                   |
| [153. The inside defines ports and the outside adapts to them](0153-the-inside-defines-ports-and-the-outside-adapts-to-them.md)                                       | Proposed | 3, 65, 118, 151                   |
| [154. The domain is modelled with domain-driven design](0154-the-domain-is-modelled-with-domain-driven-design.md)                                                     | Proposed | 64, 71, 86                        |
| [155. Code is organised by feature, for locality of behaviour](0155-code-is-organised-by-feature-for-locality-of-behaviour.md)                                        | Proposed | 151, 154                          |
| [157. The browser-facing side and the key-holding side run as separate processes](0157-the-browser-facing-side-and-the-key-holding-side-run-as-separate-processes.md) | Proposed | 61, 88, 118, 138                  |
| [158. Each hosting environment is an adapter around the application](0158-each-hosting-environment-is-an-adapter-around-the-application.md)                           | Proposed | 20, 55, 59, 153, 157              |
| [160. Schema migrations run under credentials of their own](0160-schema-migrations-run-under-credentials-of-their-own.md)                                             | Proposed | 65, 69, 104, 126, 129, 130        |
| [161. Minimal APIs, with one set of paths for every caller](0161-minimal-apis-with-one-set-of-paths-for-every-caller.md)                                              | Proposed | 11, 58, 61, 86, 87, 102, 153, 155 |
| [162. The web app's API is described by OpenAPI, and its types are generated](0162-the-web-apps-api-is-described-by-openapi-and-its-types-are-generated.md)           | Proposed | 11, 19, 148, 161                  |

## Delivery

| Record                                                                                            | Status   | Derives from |
| ------------------------------------------------------------------------------------------------- | -------- | ------------ |
| [148. Version numbers say what an update means](0148-version-numbers-say-what-an-update-means.md) | Proposed | 144          |
| [149. Master is always releasable](0149-master-is-always-releasable.md)                           | Proposed | 148          |
