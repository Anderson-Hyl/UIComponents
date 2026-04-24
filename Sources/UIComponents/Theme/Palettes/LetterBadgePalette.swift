import SwiftUI

public struct LetterBadgePalette: Sendable {
    public var hues: [Color]

    public init(hues: [Color]) {
        self.hues = hues
    }

    public subscript(index: Int) -> Color {
        guard !hues.isEmpty else { return .gray }
        let count = hues.count
        let wrapped = ((index % count) + count) % count
        return hues[wrapped]
    }

    public func color(for key: some Hashable) -> Color {
        self[key.hashValue]
    }
}

extension LetterBadgePalette {
    public static let `default` = LetterBadgePalette(hues: [
        Color(hex: 0x6B96C8),
        Color(hex: 0x967BC5),
        Color(hex: 0xC79C60),
        Color(hex: 0x6AA287),
        Color(hex: 0xBA8182),
        Color(hex: 0x81B9BA),
        Color(hex: 0xBA819E),
        Color(hex: 0x9E98BA)
    ])
}
