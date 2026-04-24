import SwiftUI

struct TrackBar: View {
    let color: Color
    let fraction: CGFloat
    var height: CGFloat = 3
    var cornerRadius: CGFloat = 2
    var opacity: Double = 1

    var body: some View {
        GeometryReader { proxy in
            HStack(spacing: 0) {
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .fill(color)
                    .opacity(opacity)
                    .frame(width: proxy.size.width * fraction, height: height)
                Spacer(minLength: 0)
            }
        }
        .frame(height: height)
    }
}

struct TrackBarRow<Content: View>: View {
    let spacing: CGFloat
    let height: CGFloat
    let content: Content

    init(spacing: CGFloat = 3, height: CGFloat = 3, @ViewBuilder content: () -> Content) {
        self.spacing = spacing
        self.height = height
        self.content = content()
    }

    var body: some View {
        GeometryReader { proxy in
            HStack(spacing: spacing) {
                content
                    .environment(\.trackBarAvailableWidth, proxy.size.width)
                Spacer(minLength: 0)
            }
        }
        .frame(height: height)
    }
}

struct FractionalBar: View {
    @Environment(\.trackBarAvailableWidth) private var availableWidth
    let color: Color
    let fraction: CGFloat
    var height: CGFloat = 3
    var cornerRadius: CGFloat = 2
    var opacity: Double = 1

    var body: some View {
        RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
            .fill(color)
            .opacity(opacity)
            .frame(width: availableWidth * fraction, height: height)
    }
}

extension EnvironmentValues {
    @Entry var trackBarAvailableWidth: CGFloat = 0
}
