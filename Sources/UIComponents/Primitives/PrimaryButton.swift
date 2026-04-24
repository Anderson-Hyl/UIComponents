import SwiftUI

public struct PrimaryButton: View {
    @Environment(\.theme) private var theme
    private let label: String
    private let action: () -> Void

    public init(_ label: String, action: @escaping () -> Void) {
        self.label = label
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            Text(label)
                .textStyle(theme.typography.drawerSend)
                .foregroundStyle(foreground)
                .padding(.vertical, 5)
                .padding(.horizontal, 12)
                .background(
                    RoundedRectangle(cornerRadius: theme.radius.primaryButton, style: .continuous)
                        .fill(background)
                )
        }
        .buttonStyle(.plain)
    }

    private var foreground: Color {
        Color(light: .white, dark: Color(hex: 0xA8C4FA))
    }

    private var background: Color {
        Color(
            light: Color(hex: 0x4C81DD),
            dark:  Color(hex: 0x7AA5FA).opacity(0.18)
        )
    }
}

#Preview {
    HStack(spacing: 0) {
        PrimaryButton("Send") {}
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Theme.default.colors.base)
            .environment(\.colorScheme, .dark)

        PrimaryButton("Send") {}
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Theme.default.colors.base)
            .environment(\.colorScheme, .light)
    }
    .frame(height: 80)
}
