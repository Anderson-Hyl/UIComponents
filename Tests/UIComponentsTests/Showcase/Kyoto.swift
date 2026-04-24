import SwiftUI
import UIComponents

struct Kyoto: View {
    @Environment(\.theme) private var theme
    @State private var promptText: String = ""

    var body: some View {
        let palette = LetterBadgePalette.default

        Shell {
            Sidebar {
                SidebarBrand("SlideFlow")

                SidebarSection("Decks") {
                    SidebarRow(name: "Kyoto Trip", count: 3, isActive: true) {
                        LetterBadge("K", color: palette[0])
                    }
                    SidebarRow(name: "Design Review", count: 12) {
                        LetterBadge("D", color: palette[1])
                    }
                    SidebarRow(name: "Q1 Plan", count: 8) {
                        LetterBadge("Q", color: palette[2])
                    }
                    SidebarRow(name: "Growth Notes", count: 5) {
                        LetterBadge("G", color: palette[3])
                    }
                }

                SidebarSection("Conversations") {
                    SidebarRow(name: "Palette draft")    { Dot() }
                    SidebarRow(name: "Inspector pass")   { Dot() }
                    SidebarRow(name: "Canvas crop")      { Dot() }
                }

                Spacer(minLength: 0)

                StatusFooter("AI bridge · 127.0.0.1:8765")
            }
        } content: {
            Toolbar(title: "Kyoto Trip", meta: "· 3 slides · edited 2m ago") {
                IconButton("⌘") {}
                IconButton("▤") {}
                KeyCap("⌘⌥W")
                KeyCap("⌘R")
            }

            TileGrid {
                CoverTile()
                ItineraryTile()
                BudgetTile()
                GhostTile("ADD SLIDE") {}
            }
        } trailing: {
            Inspector {
                SectionLabel("Slide 02")
                    .padding(.bottom, 12)

                FieldRow("Name",  value: "Itinerary")
                FieldRow("Kind",  value: "slide",  sub: "html · fragment")
                FieldRow("Order", value: "02",     sub: "of 03")
                FieldRow("Body",  value: "2.1 KB", sub: "edited 2m ago", showDivider: false)

                VStack(alignment: .leading, spacing: 6) {
                    ActionRow(glyph: "✎", label: "Edit HTML")  {}
                    ActionRow(glyph: "⎘", label: "Duplicate")  {}
                    ActionRow(glyph: "⌫", label: "Delete")     {}
                }
                .padding(.top, 16)
            }
        } overlay: {
            Drawer {
                HStack(spacing: 8) {
                    StatusDot(color: theme.colors.accent, diameter: 8)
                    Text("Assistant")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundStyle(theme.colors.primaryText)
                    Text("· Claude Opus 4.7")
                        .font(.system(size: 12))
                        .foregroundStyle(theme.colors.primaryText)
                        .opacity(0.55)
                    Spacer(minLength: 0)
                    Text("3 / 3 slides")
                        .font(.system(size: 10.5))
                        .foregroundStyle(theme.colors.primaryText)
                        .opacity(0.45)
                }

                Text("Added three slides. Palette is low-saturation warm neutrals — matches the Kyoto cover mood. Reorder with the canvas or ask me to revise any one.")
                    .textStyle(theme.typography.drawerMsg)
                    .foregroundStyle(theme.colors.primaryText)
                    .opacity(0.82)
                    .frame(maxWidth: .infinity, alignment: .leading)

                Spacer(minLength: 0)

                PromptField(
                    text: $promptText,
                    placeholder: "Ask SlideFlow to edit, add, or reorder slides…"
                )
            }
        }
    }
}

/// Wraps the shell in the same outer page chrome as `Design/design.html`
/// (pure near-black page, the shell inset by `page` padding).
struct KyotoPage: View {
    var body: some View {
        Kyoto()
            .frame(width: 1216, height: 620)
            .padding(.horizontal, 32)
            .padding(.vertical, 48)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(hex: 0x070707))
    }
}
