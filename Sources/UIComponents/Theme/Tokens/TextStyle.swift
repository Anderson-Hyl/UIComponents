import SwiftUI

public struct TextStyle: Sendable {
    public var font: Font
    public var tracking: CGFloat
    public var lineSpacing: CGFloat
    public var isUppercase: Bool

    public init(
        font: Font,
        tracking: CGFloat = 0,
        lineSpacing: CGFloat = 0,
        isUppercase: Bool = false
    ) {
        self.font = font
        self.tracking = tracking
        self.lineSpacing = lineSpacing
        self.isUppercase = isUppercase
    }
}

extension View {
    public func textStyle(_ style: TextStyle) -> some View {
        self
            .font(style.font)
            .tracking(style.tracking)
            .lineSpacing(style.lineSpacing)
            .textCase(style.isUppercase ? .uppercase : nil)
    }
}
