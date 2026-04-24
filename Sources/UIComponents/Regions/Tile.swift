import SwiftUI

public struct Tile<Content: View, Footer: View>: View {
    @Environment(\.theme) private var theme
    @State private var isHovering = false

    private let isActive: Bool
    private let action: () -> Void
    private let content: Content
    private let footer: Footer

    public init(
        isActive: Bool = false,
        action: @escaping () -> Void = {},
        @ViewBuilder content: () -> Content,
        @ViewBuilder footer: () -> Footer
    ) {
        self.isActive = isActive
        self.action = action
        self.content = content()
        self.footer = footer()
    }

    public var body: some View {
        Button(action: action) {
            ZStack(alignment: .bottomLeading) {
                theme.colors.card

                content
                    .padding(.vertical, 14)
                    .padding(.horizontal, 16)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)

                LinearGradient(
                    colors: [.black.opacity(0), .black.opacity(0.55)],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .frame(height: 42)
                .frame(maxHeight: .infinity, alignment: .bottom)
                .allowsHitTesting(false)

                footer
                    .padding(.horizontal, 12)
                    .padding(.bottom, 8)
            }
            .aspectRatio(16.0 / 9.0, contentMode: .fit)
            .clipShape(RoundedRectangle(cornerRadius: theme.radius.tile, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: theme.radius.tile, style: .continuous)
                    .strokeBorder(
                        isActive ? theme.colors.accent : theme.colors.cardEdge,
                        lineWidth: isActive ? 1.5 : 0.5
                    )
            )
            .offset(y: isHovering ? -1 : 0)
        }
        .buttonStyle(.plain)
        .onHover { isHovering = $0 }
        .animation(theme.motion.tileHover, value: isHovering)
    }
}

extension Tile where Footer == EmptyView {
    public init(
        isActive: Bool = false,
        action: @escaping () -> Void = {},
        @ViewBuilder content: () -> Content
    ) {
        self.init(
            isActive: isActive,
            action: action,
            content: content,
            footer: { EmptyView() }
        )
    }
}
