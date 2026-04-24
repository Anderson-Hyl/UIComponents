import SwiftUI

public struct StatusFooter: View {
    @Environment(\.theme) private var theme
    private let label: String
    private let status: Color?

    public init(_ label: String, status: Color? = nil) {
        self.label = label
        self.status = status
    }

    public var body: some View {
        HStack(spacing: 8) {
            StatusDot(color: status ?? theme.colors.statusOk)
            Text(label)
                .textStyle(theme.typography.statusText)
                .foregroundStyle(theme.colors.primaryText)
        }
        .opacity(0.78)
        .padding(.vertical, 10)
        .padding(.horizontal, 11)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: theme.radius.statusPill, style: .continuous)
                .fill(Color(
                    light: .black.opacity(0.025),
                    dark:  .white.opacity(0.028)
                ))
        )
    }
}
