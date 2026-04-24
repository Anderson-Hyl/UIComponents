import SwiftUI

public struct SidebarSection<Content: View>: View {
    private let label: String
    private let content: Content

    public init(_ label: String, @ViewBuilder content: () -> Content) {
        self.label = label
        self.content = content()
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 1) {
            SectionLabel(label)
                .padding(.top, 14)
                .padding(.bottom, 8)
                .padding(.horizontal, 10)
            content
        }
    }
}
