import Testing
import SwiftUI
@testable import UIComponents

@Suite("Regions")
@MainActor
struct RegionsTests {
    @Test func everyRegionComposes() {
        _ = BrandMark()
        _ = BrandMark(size: 24)

        _ = SidebarBrand("SlideFlow")
        _ = SidebarBrand("SlideFlow") { BrandMark(size: 16) }

        _ = SidebarSection("Decks") { EmptyView() }

        _ = SidebarRow(name: "Inbox")
        _ = SidebarRow(name: "Kyoto Trip", count: 3, isActive: true) {
            LetterBadge("K", color: .blue)
        }

        _ = Sidebar {
            SidebarBrand("App")
            SidebarSection("Items") { SidebarRow(name: "One") }
            StatusFooter("bridge")
        }

        _ = StatusFooter("AI bridge · 127.0.0.1:8765")
        _ = StatusFooter("degraded", status: .orange)

        _ = Toolbar(title: "Untitled")
        _ = Toolbar(title: "Kyoto Trip", meta: "· 3 slides") {
            IconButton("⌘") {}
            KeyCap("⌘R")
        }

        _ = TileGrid { EmptyView() }
        _ = TileGrid(columns: 4) { EmptyView() }

        _ = Tile { Text("body") }
        _ = Tile(isActive: true) {
            Text("body")
        } footer: {
            TileFooter(accent: .gold, label: "01 · Cover", kind: "slide")
        }

        _ = TileFooter(accent: .blue, label: "02 · Itinerary", kind: "slide")

        _ = Drawer { EmptyView() }

        _ = PromptField(text: .constant(""), placeholder: "Ask…") {}

        _ = Inspector { EmptyView() }

        _ = FieldRow("Name", value: "Itinerary")
        _ = FieldRow("Body", value: "2.1 KB", sub: "edited 2m ago", showDivider: false)

        _ = ActionRow(glyph: "✎", label: "Edit HTML") {}
    }
}
