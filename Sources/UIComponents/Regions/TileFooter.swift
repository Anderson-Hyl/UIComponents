import SwiftUI

public struct TileFooter: View {
    @Environment(\.theme) private var theme
    private let accent: AccentDot
    private let label: String
    private let kind: String?

    public init(accent: AccentDot, label: String, kind: String? = nil) {
        self.accent = accent
        self.label = label
        self.kind = kind
    }

    public var body: some View {
        HStack(spacing: 8) {
            Circle()
                .fill(accent.color)
                .frame(width: 5, height: 5)

            Text(label)
                .textStyle(theme.typography.tileFooter)
                .foregroundStyle(.white.opacity(0.92))

            Spacer(minLength: 0)

            if let kind {
                Text(kind)
                    .textStyle(theme.typography.tileKind)
                    .foregroundStyle(.white.opacity(0.75))
                    .padding(.vertical, 1.5)
                    .padding(.horizontal, 6)
                    .background(
                        RoundedRectangle(cornerRadius: theme.radius.kindChip, style: .continuous)
                            .fill(.white.opacity(0.14))
                    )
            }
        }
    }
}
