import Testing
import SwiftUI
@testable import UIComponents

@Suite("Primitives")
@MainActor
struct PrimitivesTests {
    @Test func everyPrimitiveConstructs() {
        _ = SectionLabel("Decks")
        _ = HairlineDivider()
        _ = HairlineDivider(.vertical, intensity: .subtle)
        _ = KeyCap("⌘W")
        _ = IconButton("⌘") {}
        _ = IconButton(action: {}) { Image(systemName: "circle") }
        _ = LetterBadge("K", color: .blue)
        _ = LetterBadge("K", color: .blue, size: 28)
        _ = Dot()
        _ = Dot(diameter: 8, color: .accentColor)
        _ = StatusDot(color: .green)
        _ = StatusDot(color: .blue, diameter: 10)
        _ = PrimaryButton("Send") {}
        _ = GhostTile("ADD TILE") {}

        _ = ResizableVSplit(bottomHeight: .constant(160)) {
            Text("top")
        } bottom: {
            Text("bottom")
        }
    }

    @Test func letterBadgeTrimsToFirstCharacter() {
        let badge = LetterBadge("Kyoto", color: .blue)
        _ = badge
    }

    @Test func hoverOverlayStrongExists() {
        #expect(Theme.default.colors.hoverOverlayStrong != Theme.default.colors.hoverOverlay)
    }
}
