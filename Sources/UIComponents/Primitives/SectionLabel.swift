import SwiftUI

public struct SectionLabel: View {
    @Environment(\.theme) private var theme
    private let text: String

    public init(_ text: String) {
        self.text = text
    }

    public var body: some View {
        Text(text)
            .textStyle(theme.typography.sectionLabel)
            .foregroundStyle(theme.colors.primaryText)
            .opacity(0.42)
    }
}

#Preview {
    HStack(spacing: 0) {
        VStack(alignment: .leading) {
            SectionLabel("Decks")
            SectionLabel("Conversations")
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Theme.default.colors.sidebar)
        .environment(\.colorScheme, .dark)

        VStack(alignment: .leading) {
            SectionLabel("Decks")
            SectionLabel("Conversations")
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Theme.default.colors.sidebar)
        .environment(\.colorScheme, .light)
    }
    .frame(height: 160)
}
