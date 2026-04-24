import SwiftUI

public struct BrandMark: View {
    @Environment(\.theme) private var theme
    private let size: CGFloat

    public init(size: CGFloat = 18) {
        self.size = size
    }

    public var body: some View {
        RoundedRectangle(cornerRadius: theme.radius.brandMark, style: .continuous)
            .fill(
                LinearGradient(
                    colors: [theme.colors.accent, theme.colors.accentDeep],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .frame(width: size, height: size)
            .shadow(color: theme.colors.accent.opacity(0.25), radius: 3, y: 2)
    }
}

#Preview {
    HStack(spacing: 0) {
        BrandMark()
            .padding(40)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Theme.default.colors.sidebar)
            .environment(\.colorScheme, .dark)
        BrandMark()
            .padding(40)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Theme.default.colors.sidebar)
            .environment(\.colorScheme, .light)
    }
    .frame(height: 120)
}
