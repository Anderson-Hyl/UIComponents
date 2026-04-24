import SwiftUI

public struct Shell<Leading: View, Content: View, Trailing: View, Overlay: View>: View {
    @Environment(\.theme) private var theme

    private let leading: Leading
    private let content: Content
    private let trailing: Trailing
    private let overlay: Overlay

    public init(
        @ViewBuilder leading:  () -> Leading,
        @ViewBuilder content:  () -> Content,
        @ViewBuilder trailing: () -> Trailing,
        @ViewBuilder overlay:  () -> Overlay
    ) {
        self.leading  = leading()
        self.content  = content()
        self.trailing = trailing()
        self.overlay  = overlay()
    }

    public var body: some View {
        HStack(spacing: 0) {
            leading
                .frame(width: theme.spacing.sidebarWidth)

            ZStack(alignment: .bottom) {
                VStack(spacing: 0) { content }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)

                overlay
                    .frame(maxWidth: .infinity, alignment: .bottom)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            trailing
                .frame(width: theme.spacing.inspectorWidth)
        }
        .background(theme.colors.base)
        .clipShape(RoundedRectangle(cornerRadius: theme.radius.shell, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: theme.radius.shell, style: .continuous)
                .strokeBorder(.white.opacity(0.04), lineWidth: 0.5)
        )
        .shadow(theme.elevation.shell)
    }
}

extension Shell where Overlay == EmptyView {
    public init(
        @ViewBuilder leading:  () -> Leading,
        @ViewBuilder content:  () -> Content,
        @ViewBuilder trailing: () -> Trailing
    ) {
        self.init(
            leading:  leading,
            content:  content,
            trailing: trailing,
            overlay:  { EmptyView() }
        )
    }
}
