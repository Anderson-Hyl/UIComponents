import SwiftUI

public struct StatusDot: View {
    private let color: Color
    private let diameter: CGFloat

    public init(color: Color, diameter: CGFloat = 6) {
        self.color = color
        self.diameter = diameter
    }

    public var body: some View {
        Circle()
            .fill(color)
            .frame(width: diameter, height: diameter)
            .shadow(color: color.opacity(0.5), radius: diameter, x: 0, y: 0)
    }
}

#Preview {
    HStack(spacing: 0) {
        HStack(spacing: 20) {
            StatusDot(color: Theme.default.colors.statusOk)
            StatusDot(color: Theme.default.colors.accent, diameter: 8)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Theme.default.colors.sidebar)
        .environment(\.colorScheme, .dark)

        HStack(spacing: 20) {
            StatusDot(color: Theme.default.colors.statusOk)
            StatusDot(color: Theme.default.colors.accent, diameter: 8)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Theme.default.colors.sidebar)
        .environment(\.colorScheme, .light)
    }
    .frame(height: 80)
}
