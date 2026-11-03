// SPDX-License-Identifier: MPL-2.0

import react from "@vitejs/plugin-react";
import { defineConfig } from "vitest/config";

export default defineConfig({
  plugins: [react()],
  build: {
    assetsInlineLimit: 0,
  },
  test: {
    include: ["test/**/*.test.{ts,tsx}", "packages/*/test/**/*.test.{ts,tsx}"],
  },
});
