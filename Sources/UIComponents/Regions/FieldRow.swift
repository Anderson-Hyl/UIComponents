import SwiftUI

public struct FieldRow: View {
    @Environment(\.theme) private var theme
    private let key: String
    private let value: String
    private let sub: String?
    private let showDivider: Bool

    public init(
        _ key: String,
        value: String,
        sub: String? = nil,
        showDivider: Bool = true
    ) {
        self.key = key
        self.value = value
        self.sub = sub
        self.showDivider = showDivider
    }

    public var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: theme.spacing.inspectorFieldGap) {
            Text(key)
                .textStyle(theme.typography.inspectorKey)
                .foregroundStyle(theme.colors.primaryText)
                .opacity(0.55)

            Spacer(minLength: 0)

            VStack(alignment: .trailing, spacing: 2) {
                Text(value)
                    .textStyle(theme.typography.inspectorVal)
                    .foregroundStyle(theme.colors.primaryText)
                if let sub {
                    Text(sub)
                        .textStyle(theme.typography.inspectorValSub)
                        .foregroundStyle(theme.colors.primaryText)
                        .opacity(0.5)
                }
            }
        }
        .padding(.vertical, theme.spacing.inspectorFieldVertical)
        .frame(maxWidth: .infinity)
        .hairline(showDivider ? theme.colors.strokeFaint : .clear, edge: .bottom)
    }
}
