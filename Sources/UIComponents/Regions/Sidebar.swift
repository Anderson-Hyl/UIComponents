import SwiftUI

public struct Sidebar<Content: View>: View {
    @Environment(\.theme) private var theme
    private let content: Content

    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 1) {
            content
        }
        .padding(.vertical, theme.spacing.sidebarVertical)
        .padding(.horizontal, theme.spacing.sidebarHorizontal)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(theme.colors.sidebar)
        .hairline(theme.colors.stroke, edge: .trailing)
    }
}

#Preview {
    HStack(spacing: 0) {
        Sidebar {
            SidebarBrand("SlideFlow")
            SidebarSection("Decks") {
                SidebarRow(name: "Kyoto Trip", count: 3, isActive: true) {
                    LetterBadge("K", color: LetterBadgePalette.default[0])
                }
                SidebarRow(name: "Design Review", count: 12) {
                    LetterBadge("D", color: LetterBadgePalette.default[1])
                }
                SidebarRow(name: "Q1 Plan", count: 8) {
                    LetterBadge("Q", color: LetterBadgePalette.default[2])
                }
            }
            SidebarSection("Conversations") {
                SidebarRow(name: "Palette draft") { Dot() }
                SidebarRow(name: "Inspector pass") { Dot() }
            }
            Spacer(minLength: 0)
            StatusFooter("AI bridge · 127.0.0.1:8765")
        }
        .frame(width: 228)
        .environment(\.colorScheme, .dark)

        Sidebar {
            SidebarBrand("SlideFlow")
            SidebarSection("Decks") {
                SidebarRow(name: "Kyoto Trip", count: 3, isActive: true) {
                    LetterBadge("K", color: LetterBadgePalette.default[0])
                }
                SidebarRow(name: "Design Review", count: 12) {
                    LetterBadge("D", color: LetterBadgePalette.default[1])
                }
            }
            SidebarSection("Conversations") {
                SidebarRow(name: "Palette draft") { Dot() }
            }
            Spacer(minLength: 0)
            StatusFooter("AI bridge · 127.0.0.1:8765")
        }
        .frame(width: 228)
        .environment(\.colorScheme, .light)
    }
    .frame(height: 560)
}
