// SPDX-License-Identifier: MPL-2.0

import logoUrl from "./assets/astrana-logo.svg";
import "./App.css";

export function App() {
  return (
    <main className="shell">
      <img className="shell-logo" src={logoUrl} alt="" />
      <h1 className="shell-name">Astrana</h1>
    </main>
  );
}
