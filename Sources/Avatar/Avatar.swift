import SwiftUI
import Kingfisher
import Playgrounds

public enum AvatarSize: Equatable, Sendable {
    case large
    case medium
    case small
    case xsmall
    case custom(CGFloat)
}

extension AvatarSize {
    public var size: CGFloat {
        switch self {
        case .large: 80
        case .medium: 48
        case .small: 24
        case .xsmall: 20
        case .custom(let size): size
        }
    }

    public var textFont: Font {
        switch self {
        case .large:
            return .system(size: 28, weight: .semibold)
        case .medium:
            return .system(size: 14)
        case .small:
            return .system(size: 12)
        case .xsmall:
            return .system(size: 10.4)
        case .custom(let size):
            return .system(size: size * 0.5)
        }
    }
}

public enum AvatarSource {
    case image(Image)
    case url(URL, placeholder: Image? = nil, failure: Image? = nil)
    case name(String)
    case placeholder(Image)
}

public struct Avatar: View {
    let source: AvatarSource
    let size: AvatarSize

    public init(
        source: AvatarSource,
        size: AvatarSize = .medium
    ) {
        self.source = source
        self.size = size
    }

    public var body: some View {
        ZStack {
            switch source {
            case .image(let image):
                image
                    .resizable()
                    .scaledToFill()

            case let .url(url, placeholder, failure):
                KFImageWithFallback(
                    url: url,
                    placeholder: placeholder,
                    failure: failure
                )

            case .name(let name):
                Text(Self.extractInitials(name))
                    .font(size.textFont)
                    .foregroundColor(Self.textColor(for: name))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Self.bgColor(for: name))

            case .placeholder(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .padding(size.size * 0.3)
                    .foregroundColor(.white)
                    .background(Color.gray.opacity(0.2))
            }
        }
        .frame(width: size.size, height: size.size)
        .clipShape(Circle())
        .overlay(Circle().stroke(Color.white, lineWidth: 1))
    }
}

public struct KFImageWithFallback: View {
    let url: URL
    let placeholder: Image?
    let failure: Image?

    public init(
        url: URL,
        placeholder: Image?,
        failure: Image?
    ) {
        self.url = url
        self.placeholder = placeholder
        self.failure = failure
    }
    
    @State private var didFail: Bool = false

    public var body: some View {
        ZStack {
            if didFail {
                (failure ?? Image(systemName: "person.fill.xmark"))
                    .resizable()
                    .scaledToFit()
            } else {
                KFImage(url)
                    .resizable()
                    .onFailure { _ in
                        withAnimation {
                            didFail = true
                        }
                    }
                    .placeholder {
                        (placeholder ?? Image(systemName: "person.fill"))
                            .resizable()
                            .scaledToFit()
                    }
                    .scaledToFill()
            }
        }
    }
}

extension Avatar {
    private static func extractInitials(_ name: String) -> String {
        let parts = name.split(separator: " ")
        let initials = parts
            .compactMap { $0.first }
            .prefix(2)
            .map(String.init)
            .joined()
        if initials.count == 1 {
            return String(name.prefix(2)).uppercased()
        }
        return initials.uppercased()
    }

    private static func bgColor(for name: String) -> Color {
        let hash = abs(name.hashValue)
        let hue = Double((hash % 360)) / 360.0
        return Color(hue: hue, saturation: 0.5, brightness: 0.9, opacity: 1.0)
    }

    private static func textColor(for name: String) -> Color {
        let hash = abs(name.hashValue)
        let hue = Double((hash % 360)) / 360.0
        return Color(hue: hue, saturation: 0.7, brightness: 0.3)
    }
}


#Preview {
    VStack {
        Avatar(source: .name("Anderson Huang"), size: .large)
        Avatar(source: .name("Jason Lee"), size: .medium)
        Avatar(source: .image(Image(systemName: "pencil.circle")), size: .medium)
        Avatar(source: .placeholder(Image(systemName: "wifi")), size: .medium)
    }
}
