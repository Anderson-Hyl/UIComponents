import SwiftUI

public struct Toolbar<Trailing: View>: View {
    @Environment(\.theme) private var theme
    private let title: String
    private let meta: String?
    private let trailing: Trailing

    public init(
        title: String,
        meta: String? = nil,
        @ViewBuilder trailing: () -> Trailing
    ) {
        self.title = title
        self.meta = meta
        self.trailing = trailing()
    }

    public var body: some View {
        HStack(spacing: theme.spacing.toolbarGap) {
            Text(title)
                .textStyle(theme.typography.toolbarDocTitle)
                .foregroundStyle(theme.colors.primaryText)

            if let meta {
                Text(meta)
                    .textStyle(theme.typography.toolbarMeta)
                    .foregroundStyle(theme.colors.primaryText)
                    .opacity(0.45)
                    .padding(.leading, -6)
            }

            Spacer(minLength: 0)
            trailing
        }
        .padding(.horizontal, theme.spacing.toolbarHorizontal)
        .frame(height: theme.spacing.toolbarHeight)
        .hairline(theme.colors.strokeSubtle, edge: .bottom)
    }
}

extension Toolbar where Trailing == EmptyView {
    public init(title: String, meta: String? = nil) {
        self.init(title: title, meta: meta) { EmptyView() }
    }
}

#Preview {
    VStack(spacing: 0) {
        Toolbar(title: "Kyoto Trip", meta: "· 3 slides · edited 2m ago") {
            IconButton("⌘") {}
            IconButton("▤") {}
            KeyCap("⌘⌥W")
            KeyCap("⌘R")
        }
        .background(Theme.default.colors.canvas)
        .environment(\.colorScheme, .dark)

        Toolbar(title: "Kyoto Trip", meta: "· 3 slides · edited 2m ago") {
            IconButton("⌘") {}
            IconButton("▤") {}
            KeyCap("⌘⌥W")
            KeyCap("⌘R")
        }
        .background(Theme.default.colors.canvas)
        .environment(\.colorScheme, .light)
    }
    .frame(height: 120)
}
