# 144. The interface stays fast on low-specification hardware

Proposed.

## Context

Astrana aims to run on cheap, low-specification or second-hand hardware, and to be usable on modest devices over slow
connections, because cost should not decide who can take part. A heavy or slow interface is a cost barrier of its own.
Weight added a screen at a time is hard to remove later, because each piece has something depending on it.

## Decision

The frontend has a budget for what the browser downloads and for how quickly the interface responds, measured on a
low-specification device over a slow connection, from its first build. A change that breaks the budget does not merge
until it is brought back within it.

- The budget's figures are kept in the build configuration, where the build checks them.
- Interaction has stricter limits than background work. A slow export is acceptable and a slow button is not.
- The interface acknowledges an action at once, even when the work behind it takes longer.
- Raising the budget is a change of its own, and its pull request gives the reasons.

## Consequences

- Every dependency counts against the budget, which adds a cost to each one beyond those
  [record 4](0004-astrana-depends-on-outside-components-only-where-it-must.md) weighs.
- Some designs and components have to be left out, or loaded only when they are needed, to stay within the budget.
- Optimising once the interface feels slow was rejected, because by then the weight is spread across everything.
