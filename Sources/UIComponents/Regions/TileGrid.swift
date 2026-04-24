import SwiftUI

public struct TileGrid<Content: View>: View {
    @Environment(\.theme) private var theme
    private let columns: Int
    private let content: Content

    public init(columns: Int = 3, @ViewBuilder content: () -> Content) {
        self.columns = columns
        self.content = content()
    }

    public var body: some View {
        let gridColumns = Array(
            repeating: GridItem(.flexible(), spacing: theme.spacing.canvasGap, alignment: .top),
            count: columns
        )
        LazyVGrid(
            columns: gridColumns,
            alignment: .leading,
            spacing: theme.spacing.canvasGap
        ) {
            content
        }
        .padding(theme.spacing.canvasPadding)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(theme.colors.canvas)
    }
}
