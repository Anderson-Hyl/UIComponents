import SwiftUI

public struct SidebarBrand<Mark: View>: View {
    @Environment(\.theme) private var theme
    private let name: String
    private let mark: Mark

    public init(_ name: String, @ViewBuilder mark: () -> Mark) {
        self.name = name
        self.mark = mark()
    }

    public var body: some View {
        HStack(spacing: 8) {
            mark
            Text(name)
                .textStyle(theme.typography.brandLabel)
                .foregroundStyle(theme.colors.primaryText)
        }
        .padding(.top, 4)
        .padding(.bottom, 18)
        .padding(.horizontal, 10)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

extension SidebarBrand where Mark == BrandMark {
    public init(_ name: String) {
        self.init(name) { BrandMark() }
    }
}
