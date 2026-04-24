import SwiftUI

public struct Drawer<Content: View>: View {
    @Environment(\.theme) private var theme
    private let content: Content

    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: theme.spacing.drawerGap) {
            content
        }
        .padding(.top, theme.spacing.drawerTop)
        .padding(.horizontal, theme.spacing.drawerHorizontal)
        .padding(.bottom, theme.spacing.drawerBottom)
        .frame(height: theme.spacing.drawerHeight)
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .background {
            ZStack {
                Rectangle().fill(.ultraThinMaterial)
                Rectangle().fill(Color(
                    light: Color(hex: 0xF8F7F5).opacity(0.82),
                    dark:  Color(hex: 0x0E0E0E).opacity(0.86)
                ))
            }
        }
        .hairline(theme.colors.strokeSubtle, edge: .top)
    }
}
