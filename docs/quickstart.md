# Quick start

## What you need

- Git
- Node.js 24, the version in `.nvmrc`
- PowerShell 7
- The .NET 11 software development kit, the version in `global.json`

## Set up your clone

Run this once, from the root of the repository. It checks your Node.js and .NET versions, restores the dependencies from
the lock files and installs the pinned version of Pester.

```bash
pwsh tools/scripts/Initialize-Development.ps1
```

## Run Astrana

Start the web app. It shows your changes as you save, at the address it prints.

```bash
npm run dev --prefix application/frontend
```

Start the server in a second terminal.

```bash
dotnet run --project application/backend/src/Astrana.Server
```

## Run the tests

Test the web app, check its types and build it:

```bash
npm test --prefix application/frontend
npm run typecheck --prefix application/frontend
npm run build --prefix application/frontend
```

Build and test each .NET solution. The `--ignore-exit-code 8` option accepts a solution that has no tests yet.

```bash
dotnet test --solution application/backend/Astrana.slnx --ignore-exit-code 8
dotnet test --solution owner-tools/Astrana.OwnerTools.slnx --ignore-exit-code 8
dotnet test --solution shared/Astrana.Shared.slnx --ignore-exit-code 8
```

Test the scripts in `tools/scripts/`:

```bash
pwsh -Command "Invoke-Pester tools/test"
```

## Run the other checks CI runs

```bash
npm run format:check
npm run lint
dotnet format application/backend/Astrana.slnx --verify-no-changes
dotnet format owner-tools/Astrana.OwnerTools.slnx --verify-no-changes
dotnet format shared/Astrana.Shared.slnx --verify-no-changes
pwsh tools/scripts/Test-LicenceLines.ps1
pwsh tools/scripts/Test-DocumentationStyle.ps1
```
