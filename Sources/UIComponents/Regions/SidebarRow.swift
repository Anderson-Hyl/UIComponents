import SwiftUI

public struct SidebarRow<Leading: View>: View {
    @Environment(\.theme) private var theme
    @State private var isHovering = false

    private let leading: Leading
    private let name: String
    private let count: Int?
    private let isActive: Bool
    private let action: () -> Void

    public init(
        name: String,
        count: Int? = nil,
        isActive: Bool = false,
        action: @escaping () -> Void = {},
        @ViewBuilder leading: () -> Leading
    ) {
        self.name = name
        self.count = count
        self.isActive = isActive
        self.action = action
        self.leading = leading()
    }

    public var body: some View {
        Button(action: action) {
            HStack(spacing: theme.spacing.sidebarRowGap) {
                leading

                Text(name)
                    .textStyle(isActive ? theme.typography.rowNameActive : theme.typography.rowName)
                    .foregroundStyle(theme.colors.primaryText)

                Spacer(minLength: 0)

                if let count {
                    Text("\(count)")
                        .textStyle(theme.typography.rowCount)
                        .foregroundStyle(theme.colors.primaryText)
                        .opacity(0.4)
                }
            }
            .padding(.vertical, theme.spacing.sidebarRowVertical)
            .padding(.horizontal, theme.spacing.sidebarRowHorizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: theme.radius.sidebarRow, style: .continuous)
                    .fill(fill)
            )
            .contentShape(RoundedRectangle(cornerRadius: theme.radius.sidebarRow, style: .continuous))
        }
        .buttonStyle(.plain)
        .onHover { isHovering = $0 }
        .animation(theme.motion.rowHover, value: isHovering)
        .animation(theme.motion.rowHover, value: isActive)
    }

    private var fill: Color {
        if isActive { return theme.colors.selectedOverlay }
        if isHovering { return theme.colors.hoverOverlay }
        return .clear
    }
}

extension SidebarRow where Leading == EmptyView {
    public init(
        name: String,
        count: Int? = nil,
        isActive: Bool = false,
        action: @escaping () -> Void = {}
    ) {
        self.init(name: name, count: count, isActive: isActive, action: action) { EmptyView() }
    }
}
