// SPDX-License-Identifier: MPL-2.0

import { StrictMode } from "react";
import { createRoot } from "react-dom/client";
import { App } from "./App";

const root = document.getElementById("root");
if (root === null) {
  throw new Error("The page has no element with the id root.");
}

createRoot(root).render(
  <StrictMode>
    <App />
  </StrictMode>,
);
