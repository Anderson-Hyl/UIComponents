import SwiftUI

public struct ColorTokens: Sendable {
    public var base: Color
    public var canvas: Color
    public var sidebar: Color
    public var inspector: Color
    public var card: Color
    public var input: Color
    public var stroke: Color
    public var strokeSubtle: Color
    public var strokeFaint: Color
    public var cardEdge: Color
    public var accent: Color
    public var accentDeep: Color
    public var statusOk: Color
    public var primaryText: Color
    public var hoverOverlay: Color
    public var hoverOverlayStrong: Color
    public var selectedOverlay: Color

    public init(
        base:            Color = Color(light: 0xFAFAF9, dark: 0x0E0E0E),
        canvas:          Color = Color(light: 0xFAFAF9, dark: 0x0D0D0D),
        sidebar:         Color = Color(light: 0xF2F1EE, dark: 0x111111),
        inspector:       Color = Color(light: 0xF7F5F2, dark: 0x0B0B0B),
        card:            Color = Color(light: 0xFFFFFF, dark: 0x1A1A1A),
        input:           Color = Color(light: 0xEBE9E5, dark: 0x161616),
        stroke:          Color = Color(light: 0xE7E5E1, dark: 0x1D1D1D),
        strokeSubtle:    Color = Color(light: 0xE7E5E1, dark: 0x181818),
        strokeFaint:     Color = Color(light: 0xE7E5E1, dark: 0x161616),
        cardEdge:        Color = Color(light: 0xE2E0DC, dark: 0x232323),
        accent:          Color = Color(light: 0x4C81DD, dark: 0x7AA5FA),
        accentDeep:      Color = Color(light: 0x3B68BD, dark: 0x6F8ED5),
        statusOk:        Color = Color(light: 0x5B9686, dark: 0x7AC7A8),
        primaryText:     Color = Color(light: 0x111111, dark: 0xEDEDED),
        hoverOverlay:       Color = Color(
            light: .black.opacity(0.035),
            dark:  .white.opacity(0.04)
        ),
        hoverOverlayStrong: Color = Color(
            light: .black.opacity(0.05),
            dark:  .white.opacity(0.06)
        ),
        selectedOverlay:    Color = Color(
            light: .black.opacity(0.045),
            dark:  .white.opacity(0.055)
        )
    ) {
        self.base = base
        self.canvas = canvas
        self.sidebar = sidebar
        self.inspector = inspector
        self.card = card
        self.input = input
        self.stroke = stroke
        self.strokeSubtle = strokeSubtle
        self.strokeFaint = strokeFaint
        self.cardEdge = cardEdge
        self.accent = accent
        self.accentDeep = accentDeep
        self.statusOk = statusOk
        self.primaryText = primaryText
        self.hoverOverlay = hoverOverlay
        self.hoverOverlayStrong = hoverOverlayStrong
        self.selectedOverlay = selectedOverlay
    }
}

extension ColorTokens {
    public static let `default` = ColorTokens()
}
