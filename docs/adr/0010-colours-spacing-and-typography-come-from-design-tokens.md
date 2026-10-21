# 10. Colours, spacing and typography come from design tokens

Proposed.

## Context

Astrana aims to accommodate as many people as it reasonably can (record 7). People differ in what they find comfortable
to read and use, so the interface's appearance varies. There is a light and a dark theme, and each person can set their
own display preferences, such as compact mode, which reduces spacing and font sizes. Astrana also has its own visual
design, distinct from other platforms, and it can change over time. If colours, spacing and typography are written
straight into components, every theme, preference or change to the design means finding and changing each value in every
component that uses it. Values copied into components also drift apart, so the same purpose ends up with slightly
different values in different places.

## Decision

Every colour, spacing value, corner radius, typeface, font size, font weight and line height in the interface comes
from a named design token. Components do not contain those values directly.

## Consequences

- A theme or a person's display preference is a set of token values, so adding or adjusting one changes no component.
- The component library and the app share one set of tokens.
- A token is named for its purpose, such as the colour of a warning, rather than its value, so a theme can change the
  value without the name becoming wrong.
- Writing values into components and replacing them later was rejected, because by then the values are scattered
  across the components.
