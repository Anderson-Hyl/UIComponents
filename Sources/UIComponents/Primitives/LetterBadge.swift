import SwiftUI

public struct LetterBadge: View {
    @Environment(\.theme) private var theme
    private let letter: String
    private let color: Color
    private let size: CGFloat

    public init(_ letter: String, color: Color, size: CGFloat = 20) {
        self.letter = String(letter.prefix(1))
        self.color = color
        self.size = size
    }

    public var body: some View {
        Text(letter)
            .font(.system(size: size * 0.5, weight: .semibold))
            .tracking(-0.2)
            .foregroundStyle(.white)
            .frame(width: size, height: size)
            .background(
                RoundedRectangle(cornerRadius: theme.radius.letterBadge, style: .continuous)
                    .fill(color)
            )
    }
}

#Preview {
    let palette = LetterBadgePalette.default
    let letters = Array("KDQGABCF")

    return HStack(spacing: 0) {
        HStack(spacing: 6) {
            ForEach(Array(letters.enumerated()), id: \.offset) { idx, ch in
                LetterBadge(String(ch), color: palette[idx])
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Theme.default.colors.sidebar)
        .environment(\.colorScheme, .dark)

        HStack(spacing: 6) {
            ForEach(Array(letters.enumerated()), id: \.offset) { idx, ch in
                LetterBadge(String(ch), color: palette[idx])
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Theme.default.colors.sidebar)
        .environment(\.colorScheme, .light)
    }
    .frame(height: 80)
}
