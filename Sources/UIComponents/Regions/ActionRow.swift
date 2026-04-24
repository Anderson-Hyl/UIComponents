import SwiftUI

public struct ActionRow: View {
    @Environment(\.theme) private var theme
    @State private var isHovering = false

    private let glyph: String
    private let label: String
    private let action: () -> Void

    public init(glyph: String, label: String, action: @escaping () -> Void) {
        self.glyph = glyph
        self.label = label
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                Text(glyph)
                    .font(.system(size: 11))
                    .foregroundStyle(theme.colors.primaryText)
                    .opacity(0.55)
                    .frame(width: 12, alignment: .center)

                Text(label)
                    .textStyle(theme.typography.inspectorAction)
                    .foregroundStyle(theme.colors.primaryText)

                Spacer(minLength: 0)
            }
            .padding(.vertical, 7)
            .padding(.horizontal, 10)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: theme.radius.actionRow, style: .continuous)
                    .fill(Color(light: .black.opacity(0.03), dark: .white.opacity(0.03)))
            )
            .opacity(isHovering ? 0.8 : 1)
        }
        .buttonStyle(.plain)
        .onHover { isHovering = $0 }
        .animation(theme.motion.rowHover, value: isHovering)
    }
}
