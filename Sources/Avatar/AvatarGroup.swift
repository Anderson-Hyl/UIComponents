import SwiftUI
import Playgrounds

public struct AvatarGroup: View {
    let avatars: [AvatarSource]
    let size: AvatarSize
    let limit: Int
    let showEllipsis: Bool

    public init(
        avatars: [AvatarSource],
        size: AvatarSize = .medium,
        limit: Int = 3,
        showEllipsis: Bool = false
    ) {
        self.avatars = avatars
        self.size = size
        self.limit = limit
        self.showEllipsis = showEllipsis
    }

    public var body: some View {
        HStack(spacing: 0) {
            ForEach(Array(avatars.reversed().prefix(limit).enumerated()), id: \.offset) { index, source in
                Avatar(source: source, size: size)
                    .offset(x: CGFloat(index) * (size.size * -0.3))
                    .zIndex(Double(limit - index))
            }
            if showEllipsis && avatars.count > limit {
                Avatar(source: .name("⋯"), size: size)
                    .frame(width: size.size, height: size.size)
                    .background(Color.gray.opacity(0.2))
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 1))
                    .offset(x: CGFloat(limit) * (size.size * -0.3))
                    .zIndex(0)
            }
        }
        .frame(height: size.size)
    }
}

#Preview {
    VStack {
        Avatar(source: .name("Anderson Huang"), size: .large)
        AvatarGroup(
            avatars: [
                .image(Image(systemName: "square.and.arrow.down.fill")),
                .name("Lambert Huang"),
                .placeholder(
                    Image(
                        systemName: "wifi"
                    )
                ),
                .image(Image(systemName: "20.calendar"))
            ],
            size: .medium,
            showEllipsis: true
        )
    }
}
