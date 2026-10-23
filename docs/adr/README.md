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
| [20. Each person is represented by one instance](0020-each-person-is-represented-by-one-instance.md)                                                          | Proposed | 1            |
| [21. An instance runs as one copy of the application, with one database](0021-an-instance-runs-as-one-copy-of-the-application-with-one-database.md)           | Proposed | 20           |
| [26. Usernames are unique only within an instance](0026-usernames-are-unique-only-within-an-instance.md)                                                      | Proposed | the premise  |
| [35. Every instance is managed by its owner, and nobody else operates it](0035-every-instance-is-managed-by-its-owner-and-nobody-else-operates-it.md)         | Proposed | 1            |
| [46. There are four kinds of account, and no others](0046-there-are-four-kinds-of-account-and-no-others.md)                                                   | Proposed | 1            |
| [64. An instance may run on the owner's own hardware or on hosting they rent](0064-an-instance-may-run-on-the-owners-own-hardware-or-on-hosting-they-rent.md) | Proposed | 35           |
| [77. There is no sign-up anywhere](0077-there-is-no-sign-up-anywhere.md)                                                                                      | Proposed | 2, 46        |
| [78. An account gets only what its role needs, settled in advance](0078-an-account-gets-only-what-its-role-needs-settled-in-advance.md)                       | Proposed | 46           |
| [116. A guest sees the owner's own content and may only comment and react](0116-a-guest-sees-the-owners-own-content-and-may-only-comment-and-react.md)        | Proposed | 78           |

## Peers and connections

| Record                                                                                                                                                                     | Status   | Derives from |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------------ |
| [2. Connections are mutual, and nobody follows anyone](0002-connections-are-mutual-and-nobody-follows-anyone.md)                                                           | Proposed | the premise  |
| [36. A connection reaches only the two people in it](0036-a-connection-reaches-only-the-two-people-in-it.md)                                                               | Proposed | 2            |
| [37. There are no groups](0037-there-are-no-groups.md)                                                                                                                     | Proposed | 2            |
| [38. Peers recognise each other by keys remembered when they first connect](0038-peers-recognise-each-other-by-keys-remembered-when-they-first-connect.md)                 | Proposed | 2            |
| [49. A request to a peer is a request, never a demand](0049-a-request-to-a-peer-is-a-request-never-a-demand.md)                                                            | Proposed | 2            |
| [58. A profile is seen only after connecting](0058-a-profile-is-seen-only-after-connecting.md)                                                                             | Proposed | 2, 38        |
| [59. Signals about a peer inform the owner and never act by themselves](0059-signals-about-a-peer-inform-the-owner-and-never-act-by-themselves.md)                         | Proposed | 2            |
| [62. Attestation from an organisation is always optional](0062-attestation-from-an-organisation-is-always-optional.md)                                                     | Proposed | 2            |
| [63. A former peer learns of a disconnection when they next ask](0063-a-former-peer-learns-of-a-disconnection-when-they-next-ask.md)                                       | Proposed | 2            |
| [65. Two people confirm a short code before their instances connect](0065-two-people-confirm-a-short-code-before-their-instances-connect.md)                               | Proposed | 38           |
| [66. Peers authenticate each other with a Noise handshake inside HTTPS](0066-peers-authenticate-each-other-with-a-noise-handshake-inside-https.md)                         | Proposed | 4, 38, 65    |
| [67. Peers use the Noise XX handshake pattern](0067-peers-use-the-noise-xx-handshake-pattern.md)                                                                           | Proposed | 66           |
| [68. Peers talk directly over HTTPS, with a WebSocket channel for notifications](0068-peers-talk-directly-over-https-with-a-websocket-channel-for-notifications.md)        | Proposed | 2, 38, 66    |
| [90. An instance tells its peers whether it is under guardianship or custodianship](0090-an-instance-tells-its-peers-whether-it-is-under-guardianship-or-custodianship.md) | Proposed | 46, 78, 83   |
| [93. Access is enforced by the instance that holds the content](0093-access-is-enforced-by-the-instance-that-holds-the-content.md)                                         | Proposed | 48           |
| [94. A refusal looks the same as finding nothing](0094-a-refusal-looks-the-same-as-finding-nothing.md)                                                                     | Proposed | 15, 49, 63   |
| [98. Peers see a name, sex and age bracket, never a date of birth](0098-peers-see-a-name-sex-and-age-bracket-never-a-date-of-birth.md)                                     | Proposed | 58           |
| [99. A report goes to the owner of the instance, never to the project](0099-a-report-goes-to-the-owner-of-the-instance-never-to-the-project.md)                            | Proposed | 43           |
| [100. There is no reputation system](0100-there-is-no-reputation-system.md)                                                                                                | Proposed | 9, 59        |
| [102. An instance never keeps a copy of a peer's content](0102-an-instance-never-keeps-a-copy-of-a-peers-content.md)                                                       | Proposed | 2, 68        |
| [103. A reshare refers to the original, and is relayed by the resharer's instance](0103-a-reshare-refers-to-the-original-and-is-relayed-by-the-resharers-instance.md)      | Proposed | 36, 48, 102  |
| [104. A reshare carries only a count of how many times it has been passed on](0104-a-reshare-carries-only-a-count-of-how-many-times-it-has-been-passed-on.md)              | Proposed | 103          |
| [126. Peers check what each other can do, not which version they run](0126-peers-check-what-each-other-can-do-not-which-version-they-run.md)                               | Proposed | 68           |
| [135. What leaves an instance can be kept by those who receive it](0135-what-leaves-an-instance-can-be-kept-by-those-who-receive-it.md)                                    | Proposed | 43, 102      |

## Content

| Record                                                                                                                                                                                                      | Status   | Derives from |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------------ |
| [5. Content belongs to the person who created it](0005-content-belongs-to-the-person-who-created-it.md)                                                                                                     | Proposed | the premise  |
| [6. Content expires by default](0006-content-expires-by-default.md)                                                                                                                                         | Proposed | the premise  |
| [7. An edit makes a new version, and earlier versions stay visible](0007-an-edit-makes-a-new-version-and-earlier-versions-stay-visible.md)                                                                  | Proposed | the premise  |
| [8. A post is a container, and what it holds shares its audience and its life](0008-a-post-is-a-container-and-what-it-holds-shares-its-audience-and-its-life.md)                                            | Proposed | the premise  |
| [13. Hidden details are stripped from uploads](0013-hidden-details-are-stripped-from-uploads.md)                                                                                                            | Proposed | the premise  |
| [22. An uploaded original is never altered](0022-an-uploaded-original-is-never-altered.md)                                                                                                                  | Proposed | 13           |
| [23. Media is always served through the application, never as direct access to a file](0023-media-is-always-served-through-the-application-never-as-direct-access-to-a-file.md)                             | Proposed | 22           |
| [24. Media is stored as files, not in the database](0024-media-is-stored-as-files-not-in-the-database.md)                                                                                                   | Proposed | the premise  |
| [25. Comments have one level of replies](0025-comments-have-one-level-of-replies.md)                                                                                                                        | Proposed | the premise  |
| [29. Astrana does not analyse what content depicts or means](0029-astrana-does-not-analyse-what-content-depicts-or-means.md)                                                                                | Proposed | the premise  |
| [30. Links are checked against a list held on the instance, never by sending them out](0030-links-are-checked-against-a-list-held-on-the-instance-never-by-sending-them-out.md)                             | Proposed | the premise  |
| [43. The owner of an instance may remove anything stored on it, except a report about their content](0043-the-owner-of-an-instance-may-remove-anything-stored-on-it-except-a-report-about-their-content.md) | Proposed | 1, 5         |
| [48. The owner chooses who each post is for](0048-the-owner-chooses-who-each-post-is-for.md)                                                                                                                | Proposed | 2            |
| [53. Files may be kept with an external storage provider](0053-files-may-be-kept-with-an-external-storage-provider.md)                                                                                      | Proposed | 24           |
| [54. A post that cannot save its attachments is refused, not queued](0054-a-post-that-cannot-save-its-attachments-is-refused-not-queued.md)                                                                 | Proposed | 8            |
| [55. Albums exist on their own, and posts refer to them](0055-albums-exist-on-their-own-and-posts-refer-to-them.md)                                                                                         | Proposed | 8            |
| [56. A location is chosen, never read from the device](0056-a-location-is-chosen-never-read-from-the-device.md)                                                                                             | Proposed | 8, 13        |
| [57. Content is classified again with every edit](0057-content-is-classified-again-with-every-edit.md)                                                                                                      | Proposed | 7            |
| [61. A link warning informs, and never blocks](0061-a-link-warning-informs-and-never-blocks.md)                                                                                                             | Proposed | 30           |
| [101. Search covers one instance at a time](0101-search-covers-one-instance-at-a-time.md)                                                                                                                   | Proposed | 49           |
| [106. Astrana has no direct messaging](0106-astrana-has-no-direct-messaging.md)                                                                                                                             | Proposed | 69           |
| [122. What someone searches for is not kept](0122-what-someone-searches-for-is-not-kept.md)                                                                                                                 | Proposed | 101          |
| [123. A link to content grants no access](0123-a-link-to-content-grants-no-access.md)                                                                                                                       | Proposed | 93           |

## The feed and attention

| Record                                                                                                                                            | Status   | Derives from |
| ------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------------ |
| [15. Empty, unmet and failed are shown as three different states](0015-empty-unmet-and-failed-are-shown-as-three-different-states.md)             | Proposed | 2            |
| [18. The feed is chronological and never ranked](0018-the-feed-is-chronological-and-never-ranked.md)                                              | Proposed | the premise  |
| [27. Usage tracking belongs to the person it describes](0027-usage-tracking-belongs-to-the-person-it-describes.md)                                | Proposed | the premise  |
| [45. The feed loads a page at a time and says when there is no more](0045-the-feed-loads-a-page-at-a-time-and-says-when-there-is-no-more.md)      | Proposed | 18           |
| [51. Notifications travel by Web Push, with email only as a supplement](0051-notifications-travel-by-web-push-with-email-only-as-a-supplement.md) | Proposed | 19           |
| [52. No engagement count is presented as an achievement](0052-no-engagement-count-is-presented-as-an-achievement.md)                              | Proposed | 18           |
| [97. Notifications are batched, and only material impact interrupts](0097-notifications-are-batched-and-only-material-impact-interrupts.md)       | Proposed | 51           |

## Children and guardians

| Record                                                                                                                                                                                                                                               | Status   | Derives from |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------------ |
| [32. A child can own an instance](0032-a-child-can-own-an-instance.md)                                                                                                                                                                               | Proposed | 1            |
| [33. An owner's age is declared, not verified](0033-an-owners-age-is-declared-not-verified.md)                                                                                                                                                       | Proposed | 32           |
| [34. When a child owns an instance, a parent or guardian holds authority over its parental controls](0034-when-a-child-owns-an-instance-a-parent-or-guardian-holds-authority-over-its-parental-controls.md)                                          | Proposed | 1            |
| [79. A child's instance cannot exist without a guardian](0079-a-childs-instance-cannot-exist-without-a-guardian.md)                                                                                                                                  | Proposed | 32, 34       |
| [80. Several guardians may hold equal authority](0080-several-guardians-may-hold-equal-authority.md)                                                                                                                                                 | Proposed | 34           |
| [81. A guardian signs in with an account of their own](0081-a-guardian-signs-in-with-an-account-of-their-own.md)                                                                                                                                     | Proposed | 34           |
| [82. A child cannot remove their guardian](0082-a-child-cannot-remove-their-guardian.md)                                                                                                                                                             | Proposed | 34           |
| [83. A guardian sees who a child talks to and how often, not what they say](0083-a-guardian-sees-who-a-child-talks-to-and-how-often-not-what-they-say.md)                                                                                            | Proposed | 34           |
| [84. A child can always see their guardian's oversight](0084-a-child-can-always-see-their-guardians-oversight.md)                                                                                                                                    | Proposed | 34           |
| [85. Guardianship is declared, not verified](0085-guardianship-is-declared-not-verified.md)                                                                                                                                                          | Proposed | 32, 33, 34   |
| [86. At Coming of Age, a guardian's authority ends completely and automatically](0086-at-coming-of-age-a-guardians-authority-ends-completely-and-automatically.md)                                                                                   | Proposed | 34           |
| [87. Restrictions ease in stages, and a guardian may bring a stage forward but never back](0087-restrictions-ease-in-stages-and-a-guardian-may-bring-a-stage-forward-but-never-back.md)                                                              | Proposed | 34           |
| [88. A child's instance starts with protections already on](0088-a-childs-instance-starts-with-protections-already-on.md)                                                                                                                            | Proposed | 32, 34, 87   |
| [89. Parental controls apply only to children](0089-parental-controls-apply-only-to-children.md)                                                                                                                                                     | Proposed | 34           |
| [131. Coming of Age follows the age of majority where the owner lives](0131-coming-of-age-follows-the-age-of-majority-where-the-owner-lives.md)                                                                                                      | Proposed | 86, 117, 130 |
| [132. Below the age of digital consent, choices that send data beyond the instance on a child's behalf are the guardian's](0132-below-the-age-of-digital-consent-choices-that-send-data-beyond-the-instance-on-a-childs-behalf-are-the-guardians.md) | Proposed | 34, 117      |

## Jurisdiction

| Record                                                                                                                                                                                             | Status   | Derives from  |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------------- |
| [47. The owner declares where they live](0047-the-owner-declares-where-they-live.md)                                                                                                               | Proposed | 1             |
| [91. Jurisdiction informs and never enforces](0091-jurisdiction-informs-and-never-enforces.md)                                                                                                     | Proposed | 47            |
| [92. Jurisdiction never leaves the instance](0092-jurisdiction-never-leaves-the-instance.md)                                                                                                       | Proposed | 47            |
| [117. A jurisdiction selects a small set of values, not special behaviour](0117-a-jurisdiction-selects-a-small-set-of-values-not-special-behaviour.md)                                             | Proposed | 47, 69, 70    |
| [130. An owner may decline to say where they live, and then gets a universal protective profile](0130-an-owner-may-decline-to-say-where-they-live-and-then-gets-a-universal-protective-profile.md) | Proposed | 117           |
| [134. Language changes how things are shown, not what counts as sensitive](0134-language-changes-how-things-are-shown-not-what-counts-as-sensitive.md)                                             | Proposed | 117, 124, 125 |

## Security and privacy

| Record                                                                                                                                                                                       | Status   | Derives from |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------------ |
| [9. Every material action is logged, and the log never copies content](0009-every-material-action-is-logged-and-the-log-never-copies-content.md)                                             | Proposed | the premise  |
| [10. Telemetry is for troubleshooting only, and a default installation does not contain it](0010-telemetry-is-for-troubleshooting-only-and-a-default-installation-does-not-contain-it.md)    | Proposed | the premise  |
| [11. An instance shows nothing to anyone it has no relationship with](0011-an-instance-shows-nothing-to-anyone-it-has-no-relationship-with.md)                                               | Proposed | the premise  |
| [12. When fetching from other websites, every instance looks the same](0012-when-fetching-from-other-websites-every-instance-looks-the-same.md)                                              | Proposed | the premise  |
| [14. When a protection cannot be applied, the instance holds back rather than going ahead](0014-when-a-protection-cannot-be-applied-the-instance-holds-back-rather-than-going-ahead.md)      | Proposed | the premise  |
| [16. Every file is scanned for malware when it arrives](0016-every-file-is-scanned-for-malware-when-it-arrives.md)                                                                           | Proposed | the premise  |
| [17. No stored file is ever given permission to run](0017-no-stored-file-is-ever-given-permission-to-run.md)                                                                                 | Proposed | 16           |
| [44. The audit log is pruned, not kept forever](0044-the-audit-log-is-pruned-not-kept-forever.md)                                                                                            | Proposed | 9            |
| [50. Application logs are kept apart from the audit log](0050-application-logs-are-kept-apart-from-the-audit-log.md)                                                                         | Proposed | 9            |
| [75. People sign in to the instance itself](0075-people-sign-in-to-the-instance-itself.md)                                                                                                   | Proposed | 1, 35        |
| [107. Content is cleaned when it comes in and encoded when it is shown](0107-content-is-cleaned-when-it-comes-in-and-encoded-when-it-is-shown.md)                                            | Proposed | 2, 68        |
| [108. The database is encrypted at rest](0108-the-database-is-encrypted-at-rest.md)                                                                                                          | Proposed | 71           |
| [110. A second factor is required](0110-a-second-factor-is-required.md)                                                                                                                      | Proposed | 75           |
| [111. Apps acting for the owner use a narrow form of OAuth 2.1](0111-apps-acting-for-the-owner-use-a-narrow-form-of-oauth-2-1.md)                                                            | Proposed | 75           |
| [112. Until setup is finished, the setup page answers only on the host machine](0112-until-setup-is-finished-the-setup-page-answers-only-on-the-host-machine.md)                             | Proposed | 76, 95       |
| [121. A sign-in from somewhere unfamiliar is reported to the owner, as reliably as it can be](0121-a-sign-in-from-somewhere-unfamiliar-is-reported-to-the-owner-as-reliably-as-it-can-be.md) | Proposed | 51, 75       |
| [127. The server checks everything the app checks](0127-the-server-checks-everything-the-app-checks.md)                                                                                      | Proposed | 107, 126     |
| [128. The identity, database and backup keys are independent](0128-the-identity-database-and-backup-keys-are-independent.md)                                                                 | Proposed | 38, 108      |
| [129. Passkeys are the preferred second factor](0129-passkeys-are-the-preferred-second-factor.md)                                                                                            | Proposed | 110          |
| [170. An installation resists change by anyone but its owner, and reports any change](0170-an-installation-resists-change-by-anyone-but-its-owner-and-reports-any-change.md)                 | Proposed | 1, 118       |

## Platform, data and dependencies

| Record                                                                                                                                                  | Status   | Derives from |
| ------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------------ |
| [3. Times are recorded in UTC](0003-times-are-recorded-in-utc.md)                                                                                       | Proposed | the premise  |
| [4. Astrana depends on outside components only where it must](0004-astrana-depends-on-outside-components-only-where-it-must.md)                         | Proposed | the premise  |
| [39. Only open-source components are bundled](0039-only-open-source-components-are-bundled.md)                                                          | Proposed | 1, 4         |
| [40. The backend is built on .NET](0040-the-backend-is-built-on-net.md)                                                                                 | Proposed | 4, 39        |
| [41. All data access goes through Entity Framework Core](0041-all-data-access-goes-through-entity-framework-core.md)                                    | Proposed | 4            |
| [42. Entity Framework Core is configured only through its Fluent API](0042-entity-framework-core-is-configured-only-through-its-fluent-api.md)          | Proposed | 41           |
| [70. Rules that may vary live in data, and fixed rules live in code](0070-rules-that-may-vary-live-in-data-and-fixed-rules-live-in-code.md)             | Proposed | 35, 69       |
| [71. The owner chooses PostgreSQL, MySQL or Microsoft SQL Server](0071-the-owner-chooses-postgresql-mysql-or-microsoft-sql-server.md)                   | Proposed | 35, 39, 41   |
| [72. Each database has its own schema migrations, in a project of its own](0072-each-database-has-its-own-schema-migrations-in-a-project-of-its-own.md) | Proposed | 71           |
| [149. Develop on .NET 11 and release on .NET 12 long-term support](0149-develop-on-net-11-and-release-on-net-12-long-term-support.md)                   | Proposed | 4, 66, 113   |

## Hosting and running

| Record                                                                                                                                                                                               | Status   | Derives from             |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------------------------ |
| [28. All scheduled work runs through one scheduler](0028-all-scheduled-work-runs-through-one-scheduler.md)                                                                                           | Proposed | the premise              |
| [31. Uploads stop before the disk fills](0031-uploads-stop-before-the-disk-fills.md)                                                                                                                 | Proposed | the premise              |
| [60. After a gap, the scheduler does what still needs doing, not everything it missed](0060-after-a-gap-the-scheduler-does-what-still-needs-doing-not-everything-it-missed.md)                       | Proposed | 28                       |
| [73. On modest hardware Astrana runs slower and never stops](0073-on-modest-hardware-astrana-runs-slower-and-never-stops.md)                                                                         | Proposed | 35                       |
| [76. The installer does only what must come first, and the application's setup does the rest](0076-the-installer-does-only-what-must-come-first-and-the-applications-setup-does-the-rest.md)         | Proposed | 1, 35                    |
| [95. Every installation runs behind a web server](0095-every-installation-runs-behind-a-web-server.md)                                                                                               | Proposed | 35, 66                   |
| [96. The web server handles connections, and the application decides who may do what](0096-the-web-server-handles-connections-and-the-application-decides-who-may-do-what.md)                        | Proposed | 95                       |
| [118. What an instance finds about its hosting environment is told to its owner, and nobody else](0118-what-an-instance-finds-about-its-hosting-environment-is-told-to-its-owner-and-nobody-else.md) | Proposed | 64                       |
| [119. The hosting environment must protect data and receive security fixes, however it does so](0119-the-hosting-environment-must-protect-data-and-receive-security-fixes-however-it-does-so.md)     | Proposed | 64, 118                  |
| [120. Phones are not pursued as host machines](0120-phones-are-not-pursued-as-host-machines.md)                                                                                                      | Proposed | 64                       |
| [133. An instance checks what it can about its hosting environment, rather than asking the owner](0133-an-instance-checks-what-it-can-about-its-hosting-environment-rather-than-asking-the-owner.md) | Proposed | 118                      |
| [166. Each hosting environment is an adapter around the application](0166-each-hosting-environment-is-an-adapter-around-the-application.md)                                                          | Proposed | 20, 21, 60, 64, 152, 162 |
| [167. On Windows the application runs as services behind IIS](0167-on-windows-the-application-runs-as-services-behind-iis.md)                                                                        | Proposed | 166                      |
| [168. Self-contained builds for Linux, Windows and macOS](0168-self-contained-builds-for-linux-windows-and-macos.md)                                                                                 | Proposed | 113, 149, 155            |
| [169. Only 64-bit processors are supported](0169-only-64-bit-processors-are-supported.md)                                                                                                            | Proposed | 73, 168                  |

## Versions, updates and modules

| Record                                                                                                                                                                      | Status   | Derives from                   |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------------------------------ |
| [69. Information about versions comes from one central, signed catalogue](0069-information-about-versions-comes-from-one-central-signed-catalogue.md)                       | Proposed | 35                             |
| [74. Email is sent through small, replaceable modules](0074-email-is-sent-through-small-replaceable-modules.md)                                                             | Proposed | 39                             |
| [105. The catalogue is signed by a release key that an offline root key vouches for](0105-the-catalogue-is-signed-by-a-release-key-that-an-offline-root-key-vouches-for.md) | Proposed | 69                             |
| [109. Astrana builds and signs every email module it ships](0109-astrana-builds-and-signs-every-email-module-it-ships.md)                                                   | Proposed | 74                             |
| [113. An update is never applied without the owner](0113-an-update-is-never-applied-without-the-owner.md)                                                                   | Proposed | 69                             |
| [114. Each instance decides for itself whether it is early in a staged rollout](0114-each-instance-decides-for-itself-whether-it-is-early-in-a-staged-rollout.md)           | Proposed | 69                             |
| [115. Nothing can change an instance's behaviour remotely](0115-nothing-can-change-an-instances-behaviour-remotely.md)                                                      | Proposed | 69, 70                         |
| [125. Language packs are signed, not reviewed](0125-language-packs-are-signed-not-reviewed.md)                                                                              | Proposed | 70                             |
| [157. Version numbers say what an update means](0157-version-numbers-say-what-an-update-means.md)                                                                           | Proposed | 126, 153                       |
| [171. Schema migrations run under credentials of their own](0171-schema-migrations-run-under-credentials-of-their-own.md)                                                   | Proposed | 71, 72, 76, 113, 118, 139, 140 |
| [172. The application refuses to start against a newer schema](0172-the-application-refuses-to-start-against-a-newer-schema.md)                                             | Proposed | 140, 171                       |
| [173. An update that changes the schema takes a rollback copy of the database first](0173-an-update-that-changes-the-schema-takes-a-rollback-copy-of-the-database-first.md) | Proposed | 136, 171                       |

## Backup and moving an instance

| Record                                                                                                                                                                                       | Status   | Derives from |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------------ |
| [136. An instance backs itself up into an encrypted archive](0136-an-instance-backs-itself-up-into-an-encrypted-archive.md)                                                                  | Proposed | 128          |
| [137. A backup is built and checked on the instance's own machine before it is sent anywhere](0137-a-backup-is-built-and-checked-on-the-instances-own-machine-before-it-is-sent-anywhere.md) | Proposed | 136          |
| [138. Moving an instance is a move, not a copy](0138-moving-an-instance-is-a-move-not-a-copy.md)                                                                                             | Proposed | 136          |
| [139. A restore either completes or stops, never half done](0139-a-restore-either-completes-or-stops-never-half-done.md)                                                                     | Proposed | 136          |
| [140. A backup restores into the same or a newer version, never an older one](0140-a-backup-restores-into-the-same-or-a-newer-version-never-an-older-one.md)                                 | Proposed | 136          |

## The web app

| Record                                                                                                                                                                        | Status   | Derives from             |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------------------------ |
| [19. The app is a progressive web app served by each instance](0019-the-app-is-a-progressive-web-app-served-by-each-instance.md)                                              | Proposed | the premise              |
| [124. Astrana is localised, and each person chooses their locale](0124-astrana-is-localised-and-each-person-chooses-their-locale.md)                                          | Proposed | 4                        |
| [141. The interface meets WCAG 2.1 at level AA](0141-the-interface-meets-wcag-2-1-at-level-aa.md)                                                                             | Proposed | 124                      |
| [142. The interface is responsive and designed mobile first](0142-the-interface-is-responsive-and-designed-mobile-first.md)                                                   | Proposed | 19, 124, 141             |
| [143. Colours, spacing and typography come from design tokens](0143-colours-spacing-and-typography-come-from-design-tokens.md)                                                | Proposed | 124                      |
| [144. The frontend loads assets and dependencies only from its own instance](0144-the-frontend-loads-assets-and-dependencies-only-from-its-own-instance.md)                   | Proposed | 19, 127                  |
| [145. Every page carries a Content Security Policy that allows only its own instance](0145-every-page-carries-a-content-security-policy-that-allows-only-its-own-instance.md) | Proposed | 107, 127, 144            |
| [146. Only the interface's own code produces markup](0146-only-the-interfaces-own-code-produces-markup.md)                                                                    | Proposed | 107, 145                 |
| [147. The browser never holds credentials or tokens](0147-the-browser-never-holds-credentials-or-tokens.md)                                                                   | Proposed | 107, 127, 145, 146       |
| [148. The frontend has a download and response budget that the build enforces](0148-the-frontend-has-a-download-and-response-budget-that-the-build-enforces.md)               | Proposed | 4                        |
| [150. The frontend is built with React, in functional style](0150-the-frontend-is-built-with-react-in-functional-style.md)                                                    | Proposed | 4, 19, 39, 145, 146, 148 |
| [151. The frontend is written in TypeScript with strict checking](0151-the-frontend-is-written-in-typescript-with-strict-checking.md)                                         | Proposed | 127                      |

## How the repository is built

| Record                                                                                                                                                        | Status   | Derives from |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------------ |
| [153. One repository, with a frontend and a backend](0153-one-repository-with-a-frontend-and-a-backend.md)                                                    | Proposed | 4            |
| [154. Tests live apart from the code they test](0154-tests-live-apart-from-the-code-they-test.md)                                                             | Proposed | 153          |
| [155. Every dependency version is pinned in a committed lock file](0155-every-dependency-version-is-pinned-in-a-committed-lock-file.md)                       | Proposed | 153          |
| [156. Each release lists everything it ships in a software bill of materials](0156-each-release-lists-everything-it-ships-in-a-software-bill-of-materials.md) | Proposed | 39, 155      |

## Architecture

| Record                                                                                                                                                                                           | Status   | Derives from             |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------- | ------------------------ |
| [152. The browser-facing side and the key-holding side run as separate processes](0152-the-browser-facing-side-and-the-key-holding-side-run-as-separate-processes.md)                            | Proposed | 66, 95, 128, 147         |
| [158. The architecture follows named principles, not one methodology](0158-the-architecture-follows-named-principles-not-one-methodology.md)                                                     | Proposed | 4                        |
| [159. Depend in the direction of stability](0159-depend-in-the-direction-of-stability.md)                                                                                                        | Proposed | 126                      |
| [160. Internal and external boundaries are treated differently](0160-internal-and-external-boundaries-are-treated-differently.md)                                                                | Proposed | 41, 102, 107, 127        |
| [161. Types that cross an external boundary are named Inbound and Outbound](0161-types-that-cross-an-external-boundary-are-named-inbound-and-outbound.md)                                        | Proposed | 160                      |
| [162. The inside defines ports and the outside adapts to them](0162-the-inside-defines-ports-and-the-outside-adapts-to-them.md)                                                                  | Proposed | 3, 71, 128, 159          |
| [163. The domain is modelled with domain-driven design](0163-the-domain-is-modelled-with-domain-driven-design.md)                                                                                | Proposed | 70, 78, 93               |
| [164. Code is organised by feature, for locality of behaviour](0164-code-is-organised-by-feature-for-locality-of-behaviour.md)                                                                   | Proposed | 159, 163                 |
| [165. The domain is a project of its own in the backend](0165-the-domain-is-a-project-of-its-own-in-the-backend.md)                                                                              | Proposed | 41, 153, 154, 159, 164   |
| [174. The backend's APIs are minimal APIs, whose endpoints only translate](0174-the-backends-apis-are-minimal-apis-whose-endpoints-only-translate.md)                                            | Proposed | 11, 63, 94, 96, 162, 164 |
| [175. Every caller uses one set of paths](0175-every-caller-uses-one-set-of-paths.md)                                                                                                            | Proposed | 66, 93, 111              |
| [176. Each request is resolved to exactly one caller](0176-each-request-is-resolved-to-exactly-one-caller.md)                                                                                    | Proposed | 175                      |
| [177. The instance's API is described by OpenAPI, and the web app's types are generated from it](0177-the-instances-api-is-described-by-openapi-and-the-web-apps-types-are-generated-from-it.md) | Proposed | 19, 157, 175             |
| [178. Only the signed-in web app is told the instance's version](0178-only-the-signed-in-web-app-is-told-the-instances-version.md)                                                               | Proposed | 11, 19, 126              |
| [179. Architecture rules are checked by tests](0179-architecture-rules-are-checked-by-tests.md)                                                                                                  | Proposed | 4, 159, 164, 165         |

## Delivery

| Record | Status | Derives from |
| ------ | ------ | ------------ |
