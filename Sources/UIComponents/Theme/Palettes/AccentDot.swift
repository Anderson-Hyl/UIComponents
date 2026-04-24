import SwiftUI

public struct AccentDot: Sendable {
    public var color: Color

    public init(_ color: Color) {
        self.color = color
    }

    public init(light: Color, dark: Color) {
        self.color = Color(light: light, dark: dark)
    }

    public init(light: UInt32, dark: UInt32) {
        self.color = Color(light: light, dark: dark)
    }
}

extension AccentDot {
    public static let gold       = AccentDot(light: 0xB78828, dark: 0xE8C86B)
    public static let blue       = AccentDot(light: 0x4C81DD, dark: 0x6B96C8)
    public static let green      = AccentDot(light: 0x5B9686, dark: 0x6AA287)
    public static let tan        = AccentDot(light: 0xA07347, dark: 0xB5895D)
    public static let periwinkle = AccentDot(light: 0x4C81DD, dark: 0x7AA5FA)
}
