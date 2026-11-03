// SPDX-License-Identifier: MPL-2.0

import { renderToStaticMarkup } from "react-dom/server";
import { describe, expect, it } from "vitest";
import { App } from "../src/App";

function renderMain(): string {
  const markup = renderToStaticMarkup(<App />);
  const main = /<main[^>]*>(.*)<\/main>/s.exec(markup);
  if (main === null) {
    throw new Error("The page has no main landmark.");
  }
  return main[1] ?? "";
}

describe("App", () => {
  it("names the page with the heading Astrana inside the main landmark", () => {
    expect(renderMain()).toMatch(/<h1[^>]*>Astrana<\/h1>/);
  });

  it("shows the Astrana logo inside the main landmark, served as its own file", () => {
    expect(renderMain()).toMatch(/<img[^>]*src="[^"]*astrana-logo[^"]*\.svg"/);
  });

  it("hides the logo from screen readers, so the name is not read twice", () => {
    expect(renderMain()).toMatch(/<img[^>]*alt=""/);
  });
});
