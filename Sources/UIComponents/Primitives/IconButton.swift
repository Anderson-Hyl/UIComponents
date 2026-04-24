import SwiftUI

public struct IconButton<Glyph: View>: View {
    @Environment(\.theme) private var theme
    @State private var isHovering = false

    private let glyph: Glyph
    private let action: () -> Void

    public init(action: @escaping () -> Void, @ViewBuilder glyph: () -> Glyph) {
        self.action = action
        self.glyph = glyph()
    }

    public var body: some View {
        Button(action: action) {
            glyph
                .font(.system(size: 13))
                .foregroundStyle(theme.colors.primaryText)
                .opacity(isHovering ? 1 : 0.55)
                .frame(width: 28, height: 28)
                .background(
                    RoundedRectangle(cornerRadius: theme.radius.iconButton, style: .continuous)
                        .fill(isHovering ? theme.colors.hoverOverlayStrong : .clear)
                )
        }
        .buttonStyle(.plain)
        .onHover { isHovering = $0 }
        .animation(theme.motion.iconButton, value: isHovering)
    }
}

extension IconButton where Glyph == Text {
    public init(_ label: String, action: @escaping () -> Void) {
        self.init(action: action) { Text(label) }
    }
}

#Preview {
    HStack(spacing: 0) {
        HStack(spacing: 6) {
            IconButton("⌘") {}
            IconButton("▤") {}
            IconButton(action: {}) { Image(systemName: "square.grid.2x2") }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Theme.default.colors.base)
        .environment(\.colorScheme, .dark)

        HStack(spacing: 6) {
            IconButton("⌘") {}
            IconButton("▤") {}
            IconButton(action: {}) { Image(systemName: "square.grid.2x2") }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Theme.default.colors.base)
        .environment(\.colorScheme, .light)
    }
    .frame(height: 120)
}
