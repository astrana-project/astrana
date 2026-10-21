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
| [41. There are four kinds of account, and no others](0041-there-are-four-kinds-of-account-and-no-others.md)                                                   | Proposed | 1            |
| [60. An instance may run on the owner's own hardware or on hosting they rent](0060-an-instance-may-run-on-the-owners-own-hardware-or-on-hosting-they-rent.md) | Proposed | 31           |
| [73. There is no sign-up anywhere](0073-there-is-no-sign-up-anywhere.md)                                                                                      | Proposed | 41           |
| [74. An account gets only what its role needs, settled in advance](0074-an-account-gets-only-what-its-role-needs-settled-in-advance.md)                       | Proposed | 41           |
| [111. A guest sees their host's content and can create nothing](0111-a-guest-sees-their-hosts-content-and-can-create-nothing.md)                              | Proposed | 74           |

## Peers and connections

| Record                                                                                                                                                                     | Status   | Derives from |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------------ |
| [2. Connections are mutual, and nobody follows anyone](0002-connections-are-mutual-and-nobody-follows-anyone.md)                                                           | Proposed | the premise  |
| [32. A connection reaches only the two people in it](0032-a-connection-reaches-only-the-two-people-in-it.md)                                                               | Proposed | 2            |
| [33. There are no groups](0033-there-are-no-groups.md)                                                                                                                     | Proposed | 2            |
| [34. Peers recognise each other by keys remembered when they first connect](0034-peers-recognise-each-other-by-keys-remembered-when-they-first-connect.md)                 | Proposed | 2            |
| [45. A request to a peer is a request, never a demand](0045-a-request-to-a-peer-is-a-request-never-a-demand.md)                                                            | Proposed | 2            |
| [54. A profile is seen only after connecting](0054-a-profile-is-seen-only-after-connecting.md)                                                                             | Proposed | 2            |
| [55. Signals about a peer inform the owner and never act by themselves](0055-signals-about-a-peer-inform-the-owner-and-never-act-by-themselves.md)                         | Proposed | 2            |
| [58. Attestation from an organisation is always optional](0058-attestation-from-an-organisation-is-always-optional.md)                                                     | Proposed | 2            |
| [59. A former peer learns of a disconnection when they next ask](0059-a-former-peer-learns-of-a-disconnection-when-they-next-ask.md)                                       | Proposed | 2            |
| [61. Two people confirm a short code before their instances connect](0061-two-people-confirm-a-short-code-before-their-instances-connect.md)                               | Proposed | 34           |
| [62. Peers authenticate each other with a Noise handshake inside HTTPS](0062-peers-authenticate-each-other-with-a-noise-handshake-inside-https.md)                         | Proposed | 34, 61       |
| [63. Peers use the Noise XX handshake pattern](0063-peers-use-the-noise-xx-handshake-pattern.md)                                                                           | Proposed | 62           |
| [64. Peers talk directly over HTTPS, with a WebSocket channel for notifications](0064-peers-talk-directly-over-https-with-a-websocket-channel-for-notifications.md)        | Proposed | 2, 34, 62    |
| [86. An instance tells its peers whether it is under guardianship or custodianship](0086-an-instance-tells-its-peers-whether-it-is-under-guardianship-or-custodianship.md) | Proposed | 41           |
| [89. Access is enforced by the instance that holds the content](0089-access-is-enforced-by-the-instance-that-holds-the-content.md)                                         | Proposed | 44           |
| [90. A refusal looks the same as finding nothing or not being reached](0090-a-refusal-looks-the-same-as-finding-nothing-or-not-being-reached.md)                           | Proposed | 45           |
| [95. Peers see a name, sex and age bracket, never a date of birth](0095-peers-see-a-name-sex-and-age-bracket-never-a-date-of-birth.md)                                     | Proposed | 54           |
| [97. There is no reputation system](0097-there-is-no-reputation-system.md)                                                                                                 | Proposed | 9, 55        |
| [98. Search covers one instance at a time](0098-search-covers-one-instance-at-a-time.md)                                                                                   | Proposed | 45           |
| [99. An instance never keeps a copy of a peer's content](0099-an-instance-never-keeps-a-copy-of-a-peers-content.md)                                                        | Proposed | 2, 64        |
| [120. Peers check what each other can do, not which version they run](0120-peers-check-what-each-other-can-do-not-which-version-they-run.md)                               | Proposed | 64           |
| [129. What leaves an instance can be kept by those who receive it](0129-what-leaves-an-instance-can-be-kept-by-those-who-receive-it.md)                                    | Proposed | 38, 99       |

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
| [38. The owner of an instance may remove anything stored on it](0038-the-owner-of-an-instance-may-remove-anything-stored-on-it.md)                                              | Proposed | 1, 5         |
| [44. The owner chooses who each post is for](0044-the-owner-chooses-who-each-post-is-for.md)                                                                                    | Proposed | 2            |
| [49. Files may be kept with an external storage provider](0049-files-may-be-kept-with-an-external-storage-provider.md)                                                          | Proposed | 22           |
| [50. A post that cannot save its attachments is refused, not queued](0050-a-post-that-cannot-save-its-attachments-is-refused-not-queued.md)                                     | Proposed | 8            |
| [51. Albums exist on their own, and posts refer to them](0051-albums-exist-on-their-own-and-posts-refer-to-them.md)                                                             | Proposed | 8            |
| [52. A location is chosen, never read from the device](0052-a-location-is-chosen-never-read-from-the-device.md)                                                                 | Proposed | 8, 13        |
| [53. Content is classified again with every edit](0053-content-is-classified-again-with-every-edit.md)                                                                          | Proposed | 7            |
| [57. A link warning informs, and never blocks](0057-a-link-warning-informs-and-never-blocks.md)                                                                                 | Proposed | 28           |
| [94. Resharing something publishes it anew, to the resharer's own audience](0094-resharing-something-publishes-it-anew-to-the-resharers-own-audience.md)                        | Proposed | 32, 44       |
| [96. A report goes to the owner of the instance, never to the project](0096-a-report-goes-to-the-owner-of-the-instance-never-to-the-project.md)                                 | Proposed | 38           |
| [101. Astrana has no direct messaging](0101-astrana-has-no-direct-messaging.md)                                                                                                 | Proposed | 65           |
| [117. What someone searches for is not kept](0117-what-someone-searches-for-is-not-kept.md)                                                                                     | Proposed | 98           |
| [118. A link to content grants no access](0118-a-link-to-content-grants-no-access.md)                                                                                           | Proposed | 89           |

## The feed and attention

| Record                                                                                                                                            | Status   | Derives from |
| ------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------------ |
| [15. Empty, unmet and failed are shown as three different states](0015-empty-unmet-and-failed-are-shown-as-three-different-states.md)             | Proposed | 2            |
| [16. Mistakes can be corrected](0016-mistakes-can-be-corrected.md)                                                                                | Proposed | the premise  |
| [18. The feed is chronological and never ranked](0018-the-feed-is-chronological-and-never-ranked.md)                                              | Proposed | the premise  |
| [25. Usage tracking belongs to the person it describes](0025-usage-tracking-belongs-to-the-person-it-describes.md)                                | Proposed | the premise  |
| [40. The feed loads a page at a time and says when there is no more](0040-the-feed-loads-a-page-at-a-time-and-says-when-there-is-no-more.md)      | Proposed | 18           |
| [47. Notifications travel by Web Push, with email only as a supplement](0047-notifications-travel-by-web-push-with-email-only-as-a-supplement.md) | Proposed | 19           |
| [48. No engagement count is presented as an achievement](0048-no-engagement-count-is-presented-as-an-achievement.md)                              | Proposed | 18           |
| [93. Every interruption counts as a cost](0093-every-interruption-counts-as-a-cost.md)                                                            | Proposed | 47           |

## Children and guardians

| Record                                                                                                                                                                                                        | Status   | Derives from |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------------ |
| [30. When a child owns an instance, a parent or guardian holds authority over its parental controls](0030-when-a-child-owns-an-instance-a-parent-or-guardian-holds-authority-over-its-parental-controls.md)   | Proposed | 1            |
| [42. A child can own an instance, and age is declared rather than verified](0042-a-child-can-own-an-instance-and-age-is-declared-rather-than-verified.md)                                                     | Proposed | 1            |
| [75. A child's instance cannot exist without a guardian](0075-a-childs-instance-cannot-exist-without-a-guardian.md)                                                                                           | Proposed | 30, 42       |
| [76. Several guardians may hold equal authority](0076-several-guardians-may-hold-equal-authority.md)                                                                                                          | Proposed | 30           |
| [77. A guardian signs in with an account of their own](0077-a-guardian-signs-in-with-an-account-of-their-own.md)                                                                                              | Proposed | 30           |
| [78. A child cannot remove their guardian](0078-a-child-cannot-remove-their-guardian.md)                                                                                                                      | Proposed | 30           |
| [79. A guardian sees who a child talks to and how often, not what they say](0079-a-guardian-sees-who-a-child-talks-to-and-how-often-not-what-they-say.md)                                                     | Proposed | 30           |
| [80. A child can always see their guardian's oversight](0080-a-child-can-always-see-their-guardians-oversight.md)                                                                                             | Proposed | 30           |
| [81. Guardianship is declared, not verified](0081-guardianship-is-declared-not-verified.md)                                                                                                                   | Proposed | 30, 42       |
| [82. At Coming of Age, a guardian's authority ends completely and automatically](0082-at-coming-of-age-a-guardians-authority-ends-completely-and-automatically.md)                                            | Proposed | 30           |
| [83. Restrictions ease in stages, and a guardian may bring a stage forward but never back](0083-restrictions-ease-in-stages-and-a-guardian-may-bring-a-stage-forward-but-never-back.md)                       | Proposed | 30           |
| [84. A child's instance starts with protections already on](0084-a-childs-instance-starts-with-protections-already-on.md)                                                                                     | Proposed | 30, 42       |
| [85. Parental controls apply only to children](0085-parental-controls-apply-only-to-children.md)                                                                                                              | Proposed | 30           |
| [125. Coming of Age follows the age of majority where the owner lives](0125-coming-of-age-follows-the-age-of-majority-where-the-owner-lives.md)                                                               | Proposed | 82, 112      |
| [126. Below the age of digital consent, sending anything beyond the instance is the guardian's choice](0126-below-the-age-of-digital-consent-sending-anything-beyond-the-instance-is-the-guardians-choice.md) | Proposed | 30, 112      |

## Jurisdiction

| Record                                                                                                                                                                                         | Status   | Derives from |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------------ |
| [43. The owner declares where they live](0043-the-owner-declares-where-they-live.md)                                                                                                           | Proposed | 1            |
| [87. Jurisdiction informs and never enforces](0087-jurisdiction-informs-and-never-enforces.md)                                                                                                 | Proposed | 43           |
| [88. Jurisdiction never leaves the instance](0088-jurisdiction-never-leaves-the-instance.md)                                                                                                   | Proposed | 43           |
| [112. A jurisdiction selects a small set of values, not special behaviour](0112-a-jurisdiction-selects-a-small-set-of-values-not-special-behaviour.md)                                         | Proposed | 43, 65, 66   |
| [124. An owner may decline to say where they live, and then gets the most protective defaults](0124-an-owner-may-decline-to-say-where-they-live-and-then-gets-the-most-protective-defaults.md) | Proposed | 112          |
| [128. Language changes how things are shown, not what counts as sensitive](0128-language-changes-how-things-are-shown-not-what-counts-as-sensitive.md)                                         | Proposed | 112, 119     |

## Security and privacy

| Record                                                                                                                                                                                       | Status   | Derives from |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------------ |
| [9. Every material action is logged, and the log never copies content](0009-every-material-action-is-logged-and-the-log-never-copies-content.md)                                             | Proposed | the premise  |
| [10. Telemetry is for troubleshooting only, and a default installation does not contain it](0010-telemetry-is-for-troubleshooting-only-and-a-default-installation-does-not-contain-it.md)    | Proposed | the premise  |
| [11. An instance shows nothing to anyone it has no relationship with](0011-an-instance-shows-nothing-to-anyone-it-has-no-relationship-with.md)                                               | Proposed | the premise  |
| [12. When fetching from other websites, every instance looks the same](0012-when-fetching-from-other-websites-every-instance-looks-the-same.md)                                              | Proposed | the premise  |
| [14. When a protection cannot be applied, the instance holds back rather than going ahead](0014-when-a-protection-cannot-be-applied-the-instance-holds-back-rather-than-going-ahead.md)      | Proposed | the premise  |
| [17. Every file is scanned for malware when it arrives](0017-every-file-is-scanned-for-malware-when-it-arrives.md)                                                                           | Proposed | the premise  |
| [39. The audit log is pruned, not kept forever](0039-the-audit-log-is-pruned-not-kept-forever.md)                                                                                            | Proposed | 9            |
| [46. Application logs are kept apart from the audit log](0046-application-logs-are-kept-apart-from-the-audit-log.md)                                                                         | Proposed | 9            |
| [71. People sign in to the instance itself](0071-people-sign-in-to-the-instance-itself.md)                                                                                                   | Proposed | 1, 31        |
| [102. Content is cleaned when it comes in and encoded when it is shown](0102-content-is-cleaned-when-it-comes-in-and-encoded-when-it-is-shown.md)                                            | Proposed | 2, 64        |
| [103. The database is encrypted at rest](0103-the-database-is-encrypted-at-rest.md)                                                                                                          | Proposed | 67           |
| [105. A second factor is required](0105-a-second-factor-is-required.md)                                                                                                                      | Proposed | 71           |
| [106. Apps acting for the owner use a narrow form of OAuth 2.1](0106-apps-acting-for-the-owner-use-a-narrow-form-of-oauth-2-1.md)                                                            | Proposed | 71           |
| [107. Until setup is finished, the setup page answers only on the host machine](0107-until-setup-is-finished-the-setup-page-answers-only-on-the-host-machine.md)                             | Proposed | 72           |
| [116. A sign-in from somewhere unfamiliar is reported to the owner, as reliably as it can be](0116-a-sign-in-from-somewhere-unfamiliar-is-reported-to-the-owner-as-reliably-as-it-can-be.md) | Proposed | 47, 71       |
| [121. The server checks everything the app checks](0121-the-server-checks-everything-the-app-checks.md)                                                                                      | Proposed | 102, 120     |
| [122. The identity, database and backup keys are independent](0122-the-identity-database-and-backup-keys-are-independent.md)                                                                 | Proposed | 34, 103      |
| [123. Passkeys are the preferred second factor](0123-passkeys-are-the-preferred-second-factor.md)                                                                                            | Proposed | 105          |

## Data and dependencies

| Record                                                                                                                                                  | Status   | Derives from |
| ------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------------ |
| [3. Times are recorded in UTC](0003-times-are-recorded-in-utc.md)                                                                                       | Proposed | the premise  |
| [4. Astrana depends on outside components only where it must](0004-astrana-depends-on-outside-components-only-where-it-must.md)                         | Proposed | the premise  |
| [35. Only open-source components are bundled](0035-only-open-source-components-are-bundled.md)                                                          | Proposed | 1, 4         |
| [36. All data access goes through Entity Framework Core](0036-all-data-access-goes-through-entity-framework-core.md)                                    | Proposed | 4            |
| [37. Entity Framework Core is configured only through its Fluent API](0037-entity-framework-core-is-configured-only-through-its-fluent-api.md)          | Proposed | 36           |
| [66. Rules that may vary live in data, and fixed rules live in code](0066-rules-that-may-vary-live-in-data-and-fixed-rules-live-in-code.md)             | Proposed | 31           |
| [67. The owner chooses PostgreSQL, MySQL or Microsoft SQL Server](0067-the-owner-chooses-postgresql-mysql-or-microsoft-sql-server.md)                   | Proposed | 31, 35, 36   |
| [68. Each database has its own schema migrations, in a project of its own](0068-each-database-has-its-own-schema-migrations-in-a-project-of-its-own.md) | Proposed | 67           |

## Hosting and running

| Record                                                                                                                                                                                       | Status   | Derives from |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------------ |
| [26. All scheduled work runs through one scheduler](0026-all-scheduled-work-runs-through-one-scheduler.md)                                                                                   | Proposed | the premise  |
| [29. Uploads stop before the disk fills](0029-uploads-stop-before-the-disk-fills.md)                                                                                                         | Proposed | the premise  |
| [56. After a gap, the scheduler does what still needs doing, not everything it missed](0056-after-a-gap-the-scheduler-does-what-still-needs-doing-not-everything-it-missed.md)               | Proposed | 26           |
| [69. On modest hardware Astrana runs slower and never stops](0069-on-modest-hardware-astrana-runs-slower-and-never-stops.md)                                                                 | Proposed | 31           |
| [72. The installer does only what must come first, and the application's setup does the rest](0072-the-installer-does-only-what-must-come-first-and-the-applications-setup-does-the-rest.md) | Proposed | 1, 31        |
| [91. The owner supplies the web server in front of the instance](0091-the-owner-supplies-the-web-server-in-front-of-the-instance.md)                                                         | Proposed | 31, 62       |
| [92. The web server handles connections, and the application decides who may do what](0092-the-web-server-handles-connections-and-the-application-decides-who-may-do-what.md)                | Proposed | 91           |
| [113. What an instance finds about its host is told to its owner, and nobody else](0113-what-an-instance-finds-about-its-host-is-told-to-its-owner-and-nobody-else.md)                       | Proposed | 60           |
| [114. The host must protect data and receive security fixes, however it does so](0114-the-host-must-protect-data-and-receive-security-fixes-however-it-does-so.md)                           | Proposed | 60           |
| [115. Phones are not pursued as hosts](0115-phones-are-not-pursued-as-hosts.md)                                                                                                              | Proposed | 60           |
| [127. An instance checks what it can about its host, rather than asking the owner](0127-an-instance-checks-what-it-can-about-its-host-rather-than-asking-the-owner.md)                       | Proposed | 113          |

## Versions, updates and modules

| Record                                                                                                                                                                         | Status   | Derives from |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------- | ------------ |
| [65. Information about versions comes from one central, signed catalogue](0065-information-about-versions-comes-from-one-central-signed-catalogue.md)                          | Proposed | 31           |
| [70. Email is sent through small, replaceable modules](0070-email-is-sent-through-small-replaceable-modules.md)                                                                | Proposed | 35           |
| [100. The project's primary maintainer holds the key that signs the version catalogue](0100-the-projects-primary-maintainer-holds-the-key-that-signs-the-version-catalogue.md) | Proposed | 65           |
| [104. Astrana builds and signs every email module it ships](0104-astrana-builds-and-signs-every-email-module-it-ships.md)                                                      | Proposed | 70           |
| [108. An update is never applied without the owner](0108-an-update-is-never-applied-without-the-owner.md)                                                                      | Proposed | 65           |
| [109. Each instance decides for itself whether it is early in a staged rollout](0109-each-instance-decides-for-itself-whether-it-is-early-in-a-staged-rollout.md)              | Proposed | 65           |
| [110. Nothing can change an instance's behaviour remotely](0110-nothing-can-change-an-instances-behaviour-remotely.md)                                                         | Proposed | 65           |
| [119. Language packs are signed, not reviewed](0119-language-packs-are-signed-not-reviewed.md)                                                                                 | Proposed | 66           |

## Backup and moving an instance

| Record                                                                                                                                                                                       | Status   | Derives from |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------------ |
| [130. An instance backs itself up into an encrypted archive](0130-an-instance-backs-itself-up-into-an-encrypted-archive.md)                                                                  | Proposed | 122          |
| [131. A backup is built and checked on the instance's own machine before it is sent anywhere](0131-a-backup-is-built-and-checked-on-the-instances-own-machine-before-it-is-sent-anywhere.md) | Proposed | 130          |
| [132. Moving an instance is a move, not a copy](0132-moving-an-instance-is-a-move-not-a-copy.md)                                                                                             | Proposed | 130          |
| [133. A restore either completes or stops, never half done](0133-a-restore-either-completes-or-stops-never-half-done.md)                                                                     | Proposed | 130          |
| [134. A backup restores into the same or a newer version, never an older one](0134-a-backup-restores-into-the-same-or-a-newer-version-never-an-older-one.md)                                 | Proposed | 130          |

## The web app

| Record                                                                                                                                                                        | Status   | Derives from  |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------------- |
| [19. The app is a progressive web app served by each instance](0019-the-app-is-a-progressive-web-app-served-by-each-instance.md)                                              | Proposed | the premise   |
| [135. Astrana is localised, and each person chooses their locale](0135-astrana-is-localised-and-each-person-chooses-their-locale.md)                                          | Proposed | the premise   |
| [136. The interface meets WCAG 2.1 at level AA](0136-the-interface-meets-wcag-2-1-at-level-aa.md)                                                                             | Proposed | the premise   |
| [137. The interface is responsive and designed mobile first](0137-the-interface-is-responsive-and-designed-mobile-first.md)                                                   | Proposed | the premise   |
| [138. Colours, spacing and typography come from design tokens](0138-colours-spacing-and-typography-come-from-design-tokens.md)                                                | Proposed | the premise   |
| [139. The frontend loads assets and dependencies only from its own instance](0139-the-frontend-loads-assets-and-dependencies-only-from-its-own-instance.md)                   | Proposed | the premise   |
| [140. Every page carries a Content Security Policy that allows only its own instance](0140-every-page-carries-a-content-security-policy-that-allows-only-its-own-instance.md) | Proposed | 102, 121, 139 |
| [141. Only the interface's own code produces markup](0141-only-the-interfaces-own-code-produces-markup.md)                                                                    | Proposed | the premise   |
| [142. The browser never holds credentials or tokens](0142-the-browser-never-holds-credentials-or-tokens.md)                                                                   | Proposed | the premise   |
| [143. The interface stays fast on low-specification hardware](0143-the-interface-stays-fast-on-low-specification-hardware.md)                                                 | Proposed | the premise   |
| [146. The frontend is built with React, in functional style](0146-the-frontend-is-built-with-react-in-functional-style.md)                                                    | Proposed | the premise   |
| [147. The frontend is written in TypeScript with strict checking](0147-the-frontend-is-written-in-typescript-with-strict-checking.md)                                         | Proposed | the premise   |

## How the repository is built

| Record                                                                                                                                                                       | Status   | Derives from           |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ---------------------- |
| [144. The backend is built on .NET](0144-the-backend-is-built-on-net.md)                                                                                                     | Proposed | the premise            |
| [145. Develop on .NET 11 and release on .NET 12 long-term support](0145-develop-on-net-11-and-release-on-net-12-long-term-support.md)                                        | Proposed | 4                      |
| [148. One repository, with a frontend and a backend](0148-one-repository-with-a-frontend-and-a-backend.md)                                                                   | Proposed | 4                      |
| [149. Tests live apart from the code they test](0149-tests-live-apart-from-the-code-they-test.md)                                                                            | Proposed | 148                    |
| [150. Every dependency version is pinned in a committed lock file](0150-every-dependency-version-is-pinned-in-a-committed-lock-file.md)                                      | Proposed | 148                    |
| [151. Each release lists everything it ships in a software bill of materials](0151-each-release-lists-everything-it-ships-in-a-software-bill-of-materials.md)                | Proposed | 150                    |
| [161. The domain is a project of its own in the backend](0161-the-domain-is-a-project-of-its-own-in-the-backend.md)                                                          | Proposed | 36, 148, 149, 155, 160 |
| [165. Self-contained builds for Linux, Windows and macOS](0165-self-contained-builds-for-linux-windows-and-macos.md)                                                         | Proposed | 108, 145, 150          |
| [166. Only 64-bit processors are supported](0166-only-64-bit-processors-are-supported.md)                                                                                    | Proposed | 69, 165                |
| [167. An installation resists change by anyone but its owner, and reports any change](0167-an-installation-resists-change-by-anyone-but-its-owner-and-reports-any-change.md) | Proposed | 1, 113                 |
| [176. Architecture rules are checked by tests](0176-architecture-rules-are-checked-by-tests.md)                                                                              | Proposed | 4, 155, 160, 161       |

## Architecture

| Record                                                                                                                                                                | Status   | Derives from          |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | --------------------- |
| [154. The architecture follows named principles, not one methodology](0154-the-architecture-follows-named-principles-not-one-methodology.md)                          | Proposed | 4                     |
| [155. Depend in the direction of stability](0155-depend-in-the-direction-of-stability.md)                                                                             | Proposed | 120                   |
| [156. Internal and external boundaries are treated differently](0156-internal-and-external-boundaries-are-treated-differently.md)                                     | Proposed | 36, 99, 102, 121      |
| [157. Types that cross an external boundary are named Inbound and Outbound](0157-types-that-cross-an-external-boundary-are-named-inbound-and-outbound.md)             | Proposed | 156                   |
| [158. The inside defines ports and the outside adapts to them](0158-the-inside-defines-ports-and-the-outside-adapts-to-them.md)                                       | Proposed | 3, 67, 122, 155       |
| [159. The domain is modelled with domain-driven design](0159-the-domain-is-modelled-with-domain-driven-design.md)                                                     | Proposed | 66, 74, 89            |
| [160. Code is organised by feature, for locality of behaviour](0160-code-is-organised-by-feature-for-locality-of-behaviour.md)                                        | Proposed | 155, 159              |
| [162. The browser-facing side and the key-holding side run as separate processes](0162-the-browser-facing-side-and-the-key-holding-side-run-as-separate-processes.md) | Proposed | 62, 91, 122, 142      |
| [163. Each hosting environment is an adapter around the application](0163-each-hosting-environment-is-an-adapter-around-the-application.md)                           | Proposed | 20, 56, 60, 158, 162  |
| [164. On Windows the application runs as services behind IIS](0164-on-windows-the-application-runs-as-services-behind-iis.md)                                         | Proposed | 163                   |
| [168. Schema migrations run under credentials of their own](0168-schema-migrations-run-under-credentials-of-their-own.md)                                             | Proposed | 67, 72, 108, 133, 134 |
| [169. The application refuses to start against a newer schema](0169-the-application-refuses-to-start-against-a-newer-schema.md)                                       | Proposed | 134, 168              |
| [170. An update that changes the schema takes a rollback snapshot first](0170-an-update-that-changes-the-schema-takes-a-rollback-snapshot-first.md)                   | Proposed | 130, 168              |
| [171. The backend's APIs are minimal APIs, whose endpoints only translate](0171-the-backends-apis-are-minimal-apis-whose-endpoints-only-translate.md)                 | Proposed | 11, 59, 90, 158, 160  |
| [172. Every caller uses one set of paths](0172-every-caller-uses-one-set-of-paths.md)                                                                                 | Proposed | 62, 89, 106           |
| [173. Each request is resolved to exactly one caller](0173-each-request-is-resolved-to-exactly-one-caller.md)                                                         | Proposed | 172                   |
| [174. The web app's API is described by OpenAPI, and its types are generated](0174-the-web-apps-api-is-described-by-openapi-and-its-types-are-generated.md)           | Proposed | 19, 152, 172          |
| [175. Only the signed-in web app is told the instance's version](0175-only-the-signed-in-web-app-is-told-the-instances-version.md)                                    | Proposed | 11, 19, 120           |

## Delivery

| Record                                                                                            | Status   | Derives from |
| ------------------------------------------------------------------------------------------------- | -------- | ------------ |
| [152. Version numbers say what an update means](0152-version-numbers-say-what-an-update-means.md) | Proposed | 148          |
| [153. Master is always releasable](0153-master-is-always-releasable.md)                           | Proposed | 152          |
