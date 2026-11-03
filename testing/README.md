# Testing

This folder is for tests and test data that cover more than one project, or both applications. To find the tests of a
single project, look in the `test/` folder beside it.

- `end-to-end/` is for tests that drive a running instance through the browser, or Astrana Owner Tools through its
  commands, from start to finish.
- `personas/` is for the fake people the fake data generator builds test instances from. Fake data uses reserved names,
  such as `.test` domains, so it can never pass for a real person or reach a real peer.
- `samples/astrabak/` is for a sample backup for each version of the `.astrabak` format. Every later version must still
  restore each of them.
- `samples/media/` is for images, audio and video for testing how media is handled.

Never put real people's data here.
