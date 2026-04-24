import SwiftUI

public struct KeyCap: View {
    @Environment(\.theme) private var theme
    private let label: String

    public init(_ label: String) {
        self.label = label
    }

    public var body: some View {
        Text(label)
            .textStyle(theme.typography.keyCap)
            .foregroundStyle(theme.colors.primaryText)
            .opacity(0.55)
            .padding(.vertical, 3)
            .padding(.horizontal, 7)
            .background(
                RoundedRectangle(cornerRadius: theme.radius.keyCap, style: .continuous)
                    .fill(theme.colors.input)
            )
    }
}

#Preview {
    HStack(spacing: 0) {
        HStack(spacing: 8) {
            KeyCap("⌘⌥W")
            KeyCap("⌘R")
            KeyCap("⇧⌘S")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Theme.default.colors.base)
        .environment(\.colorScheme, .dark)

        HStack(spacing: 8) {
            KeyCap("⌘⌥W")
            KeyCap("⌘R")
            KeyCap("⇧⌘S")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Theme.default.colors.base)
        .environment(\.colorScheme, .light)
    }
    .frame(height: 120)
}
