# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project state

Freshly scaffolded SwiftPM library (`swift-tools-version: 6.2`). The Swift source is still boilerplate; the substance lives in `Design/design.html` — a self-contained HTML mock that is the visual + token specification the library must implement. When asked to "build a component" or "implement the design," treat `Design/design.html` as the source of truth, not the Swift files.

Tests use the Swift Testing framework (`import Testing`, `@Test`, `#expect(...)`), not XCTest.

## Platform & tooling

- Intended destinations: iOS, iPadOS, and Mac ("Designed for iPad") — all iOS SDK. Floor is **iOS 26**.
- `Package.swift` declares both `.iOS(.v26)` *and* `.macOS(.v26)`. The macOS floor exists solely so `swift build` / `swift test` run on the Mac host during development; it is not an officially supported destination. Do not add AppKit-specific code on the strength of the macOS platform entry.
- SwiftUI only. Avoid UIKit/AppKit bridges unless a primitive cannot be expressed in pure SwiftUI.
- The test target doubles as a living showcase: it is where the full `Design/design.html` mock gets reproduced in SwiftUI for snapshot-test acceptance.

## Commands

```bash
swift build
swift test
swift test --filter UIComponentsTests.example    # single test by suite.name
```

## Scope & naming

This is a **general-purpose** design-system library. Consumers are arbitrary apps, not a slide-deck app.

- **Do not** use domain terms from the mock: `deck`, `slide`, `canvas`, `inspector-as-slide-metadata`, `chat`, `bridge`, `assistant`, `composer`, `SlideFlow`, etc. They describe the *example*, not the components.
- Prefer generic names: `Tile` (not `SlideCard`), `TileGrid` (not `SlideCanvas`), `GhostTile` (not `NewSlideCard`), `LetterBadge` (not `DeckDot`), `StatusFooter` (not `BridgePill`), `Drawer` (not `ChatDrawer`), `PromptField` (not `ComposerInput`), `Shell` / `TriPaneShell` (not `WorkspaceShell`). `Sidebar` and `Inspector` are kept — they are zone names, not slide-deck terms.
- No library prefix — plain names.
- Color tokens follow the HTML ladder literally (`content`, `sidebar`, `inspector`, `card`, `input`, `stroke`, `accent`) except `bridge ok` is renamed to `statusOk` to avoid the mock's domain term.

## Architecture

Single `Theme` struct threaded through `@Environment(\.theme)`. Default resolves from `colorScheme`; callers can pin with `.environment(\.theme, .dark)`. Colors use `Color(light:dark:)` so one token swaps automatically — avoid writing two code paths per component.

```
Theme
├── colors       surfaces (base/sidebar/inspector/card/input), stroke, accent, statusOk, text-on-surface
├── typography   named roles: sectionLabel, rowName, docTitle, kbd, thumbH, thumbHSmall, thumbBody, …
├── radius       shell (16), card (14), tile (9), sidebarRow (7), drawerInput (10), iconBtn (7), letterBadge (5.5), brandMark (5), actionRow (6)
├── spacing      canvasPad (22), canvasGap (16), toolbarH (42), drawerH (160), sidebarPad (14/10), …
├── motion       rowHover (80 ms), iconBtn (100 ms), tileHover (120 ms)
└── elevation    outer shell shadow (the *only* drop shadow in the system); hairline-stroke helper
```

Two data-not-tokens palettes sit outside `Theme`: `LetterBadgePalette` (8 desaturated hues, `S≈0.38 L≈0.58`) and `AccentDot` (cover/itinerary/budget-style accent colors with light-mode counterparts).

## Design tokens (from Design/design.html)

Keep parity between dark and light. If you add a role, add it to both columns.

| role       | dark       | light      |
| ---------- | ---------- | ---------- |
| content    | `#0E0E0E`  | `#FAFAF9`  |
| sidebar    | `#111111`  | `#F2F1EE`  |
| inspector  | `#0B0B0B`  | `#F7F5F2`  |
| card       | `#1A1A1A`  | `#FFFFFF`  |
| input      | `#161616`  | `#EBE9E5`  |
| stroke     | `#1D1D1D`  | `#E7E5E1`  |
| accent     | `#7AA5FA`  | `#4C81DD`  |
| statusOk   | `#7AC7A8`  | `#5B9686`  |

Principles that the code must not drift from:
- **True neutrals, no cast.** No blue tint in dark; warmth Δ ≤ 3 in light.
- **One accent, used sparingly.** Active row, primary CTA, chart data — never status decoration.
- **Chrome subtraction.** Borders are 0.5pt tonal shifts, never visible strokes. Shadows live only on the outer shell. Hover = 4–5% tint, no lift.
- **Typography leads.** Section labels 10 UPPERCASE @ 42% opacity + 0.9 tracking. Row names 12.5 / weight 400 idle → 500 active. Hierarchy via weight/tone, not dividers.
- **Inspector is a list**, not a nested panel — key/value rows with bottom-border ticks.
- **Canvas breathes.** 22 outer padding, 16 gap, tiles are pure 16:9 with a gradient scrim + footer overlay (no title row under the tile).

## SwiftUI conventions (from the modern-swiftui skill)

- **Action closures stay single-line.** Multiline logic moves to a private method on the view, named after the user action (`addTileTapped`, `sendPromptTapped`), not after what runs (`insertItem`, `submit`). Make the method `async` if it does async work, wrap the call site in `Task { await … }`.
- **Never `Binding(get:set:)`.** Derive new bindings via extensions on the binding's `Value` type (dynamic member lookup for plain derivations, a `Hashable`-arg subscript when the derivation needs data).
- Prefer `@State` for view-local UI state; hoist to the caller via `@Binding` only when the caller cares.

## Snapshot testing

Every primitive and region ships with a snapshot test in both color schemes. Use the `snapshot-testing` skill when adding or inspecting snapshots — prefer calling the skill over rolling custom harnesses.

## Build order

Work proceeds in this order; each phase unblocks the next.

1. **Foundations** — `Theme` + six token structs, environment wiring, `Color(light:dark:)`, `hairline(_:edges:)` modifier, `LetterBadgePalette`, `AccentDot`.
2. **Primitives** — `SectionLabel`, `HairlineDivider`, `KeyCap`, `IconButton`, `LetterBadge`, `Dot`, `StatusDot`, `PrimaryButton`, `GhostTile`.
3. **Regions** — `Sidebar`, `SidebarRow`, `BrandMark`, `StatusFooter`, `Toolbar`, `TileGrid`, `Tile`, `TileFooter`, `Drawer`, `PromptField`, `Inspector`, `FieldRow`, `ActionRow`. Order within: `Sidebar → Inspector → Toolbar → TileGrid/Tile → Drawer` (drawer last because the material blend is the trickiest piece).
4. **Shell** — `Shell<Leading, Content, Trailing, Overlay>` composing everything. The drawer overlays the center column, not a fourth grid child (matches CSS `position: absolute; left: 228; right: 260`).
5. **Showcase in test target** — reproduce the full `Design/design.html` mock (Kyoto Trip, both schemes) as the acceptance bar, covered by snapshot tests.
