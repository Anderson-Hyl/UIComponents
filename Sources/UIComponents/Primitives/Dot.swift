import SwiftUI

public struct Dot: View {
    @Environment(\.theme) private var theme
    private let diameter: CGFloat
    private let color: Color?

    public init(diameter: CGFloat = 6, color: Color? = nil) {
        self.diameter = diameter
        self.color = color
    }

    public var body: some View {
        Circle()
            .fill(color ?? theme.colors.primaryText.opacity(0.45))
            .frame(width: diameter, height: diameter)
    }
}

#Preview {
    HStack(spacing: 0) {
        HStack(spacing: 12) {
            Dot()
            Dot(diameter: 8)
            Dot(diameter: 10, color: Theme.default.colors.accent)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Theme.default.colors.sidebar)
        .environment(\.colorScheme, .dark)

        HStack(spacing: 12) {
            Dot()
            Dot(diameter: 8)
            Dot(diameter: 10, color: Theme.default.colors.accent)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Theme.default.colors.sidebar)
        .environment(\.colorScheme, .light)
    }
    .frame(height: 80)
}
