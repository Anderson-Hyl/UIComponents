import SwiftUI

public struct GhostTile: View {
    @Environment(\.theme) private var theme
    @State private var isHovering = false

    private let label: String
    private let action: () -> Void

    public init(_ label: String, action: @escaping () -> Void) {
        self.label = label
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            VStack(spacing: 8) {
                Text(verbatim: "+")
                    .font(.system(size: 17, weight: .medium))
                    .foregroundStyle(theme.colors.accent)
                    .frame(width: 30, height: 30)
                    .background(
                        RoundedRectangle(cornerRadius: theme.radius.ghostBadge, style: .continuous)
                            .fill(plusBadgeFill)
                    )

                Text(label)
                    .textStyle(theme.typography.ghostLabel)
                    .foregroundStyle(labelColor)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .aspectRatio(16.0 / 9.0, contentMode: .fit)
            .background(
                RoundedRectangle(cornerRadius: theme.radius.tile, style: .continuous)
                    .fill(tileFill)
            )
            .overlay(
                RoundedRectangle(cornerRadius: theme.radius.tile, style: .continuous)
                    .strokeBorder(
                        borderColor,
                        style: StrokeStyle(
                            lineWidth: 1.2,
                            dash: isHovering ? [] : [4, 3]
                        )
                    )
            )
        }
        .buttonStyle(.plain)
        .onHover { isHovering = $0 }
        .animation(theme.motion.ghostTile, value: isHovering)
    }

    private var labelColor: Color {
        isHovering ? theme.colors.accent : theme.colors.primaryText.opacity(0.5)
    }

    private var borderColor: Color {
        isHovering
            ? theme.colors.accent
            : Color(light: 0xD2D0CB, dark: 0x262626)
    }

    private var tileFill: Color {
        isHovering
            ? Color(
                light: Color(hex: 0x4C81DD).opacity(0.06),
                dark:  Color(hex: 0x7AA5FA).opacity(0.06)
              )
            : .clear
    }

    private var plusBadgeFill: Color {
        Color(
            light: Color(hex: 0x4C81DD).opacity(0.12),
            dark:  Color(hex: 0x7AA5FA).opacity(0.14)
        )
    }
}

#Preview {
    HStack(spacing: 0) {
        GhostTile("ADD TILE") {}
            .padding(22)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Theme.default.colors.canvas)
            .environment(\.colorScheme, .dark)

        GhostTile("ADD TILE") {}
            .padding(22)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Theme.default.colors.canvas)
            .environment(\.colorScheme, .light)
    }
    .frame(height: 240)
}
