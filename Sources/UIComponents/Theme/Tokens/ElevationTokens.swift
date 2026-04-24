import SwiftUI

public struct Shadow: Sendable {
    public var color: Color
    public var radius: CGFloat
    public var x: CGFloat
    public var y: CGFloat

    public init(
        color: Color = .black.opacity(0.2),
        radius: CGFloat = 0,
        x: CGFloat = 0,
        y: CGFloat = 0
    ) {
        self.color = color
        self.radius = radius
        self.x = x
        self.y = y
    }
}

extension View {
    public func shadow(_ shadow: Shadow) -> some View {
        self.shadow(color: shadow.color, radius: shadow.radius, x: shadow.x, y: shadow.y)
    }
}

public struct ElevationTokens: Sendable {
    public var shell: Shadow

    public init(
        shell: Shadow = Shadow(color: .black.opacity(0.7), radius: 40, x: 0, y: 24)
    ) {
        self.shell = shell
    }
}

extension ElevationTokens {
    public static let `default` = ElevationTokens()
}
