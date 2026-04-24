import Testing
import SwiftUI
@testable import UIComponents

@Suite("Foundations")
struct FoundationsTests {
    @Test func themeDefaultsMatchSpec() {
        let theme = Theme.default

        #expect(theme.radius.shell == 16)
        #expect(theme.radius.tile == 9)
        #expect(theme.radius.sidebarRow == 7)
        #expect(theme.radius.inputChip == 10)

        #expect(theme.spacing.shellHeight == 620)
        #expect(theme.spacing.sidebarWidth == 228)
        #expect(theme.spacing.inspectorWidth == 260)
        #expect(theme.spacing.canvasPadding == 22)
        #expect(theme.spacing.canvasGap == 16)
        #expect(theme.spacing.toolbarHeight == 42)
        #expect(theme.spacing.drawerHeight == 160)
    }

    @Test func themeOverridesPreserveUntouchedTokens() {
        let theme = Theme(radius: RadiusTokens(shell: 20))
        #expect(theme.radius.shell == 20)
        #expect(theme.radius.tile == 9)
        #expect(theme.spacing.canvasPadding == 22)
    }

    @Test func letterBadgePaletteHasEightHues() {
        #expect(LetterBadgePalette.default.hues.count == 8)
    }

    @Test func letterBadgeIndexWrapsBothDirections() {
        let palette = LetterBadgePalette(hues: [.red, .green, .blue, .yellow])
        let base = palette.hues

        #expect(palette[0] == base[0])
        #expect(palette[4] == base[0])
        #expect(palette[5] == base[1])
        #expect(palette[-1] == base[3])
        #expect(palette[-5] == base[3])
    }

    @Test func emptyPaletteReturnsGray() {
        let palette = LetterBadgePalette(hues: [])
        #expect(palette[0] == .gray)
    }

    @Test func accentDotsFromShowcaseExist() {
        _ = AccentDot.gold
        _ = AccentDot.blue
        _ = AccentDot.green
        _ = AccentDot.tan
        _ = AccentDot.periwinkle
    }
}
