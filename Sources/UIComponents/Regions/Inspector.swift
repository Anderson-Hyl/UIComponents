import SwiftUI

public struct Inspector<Content: View>: View {
    @Environment(\.theme) private var theme
    private let content: Content

    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            content
        }
        .padding(.vertical, theme.spacing.inspectorVertical)
        .padding(.horizontal, theme.spacing.inspectorHorizontal)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(theme.colors.inspector)
        .hairline(theme.colors.strokeSubtle, edge: .leading)
    }
}
