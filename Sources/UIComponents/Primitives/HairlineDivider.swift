import SwiftUI

public enum HairlineIntensity: Sendable {
    case standard
    case subtle
    case faint
}

public struct HairlineDivider: View {
    @Environment(\.theme) private var theme
    private let orientation: Axis
    private let intensity: HairlineIntensity

    public init(
        _ orientation: Axis = .horizontal,
        intensity: HairlineIntensity = .standard
    ) {
        self.orientation = orientation
        self.intensity = intensity
    }

    public var body: some View {
        Rectangle()
            .fill(color)
            .frame(
                width:  orientation == .vertical   ? 0.5 : nil,
                height: orientation == .horizontal ? 0.5 : nil
            )
    }

    private var color: Color {
        switch intensity {
        case .standard: theme.colors.stroke
        case .subtle:   theme.colors.strokeSubtle
        case .faint:    theme.colors.strokeFaint
        }
    }
}

#Preview {
    HStack(spacing: 0) {
        VStack(alignment: .leading, spacing: 12) {
            Text("standard").foregroundStyle(.white.opacity(0.5))
            HairlineDivider()
            Text("subtle").foregroundStyle(.white.opacity(0.5))
            HairlineDivider(intensity: .subtle)
            Text("faint").foregroundStyle(.white.opacity(0.5))
            HairlineDivider(intensity: .faint)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Theme.default.colors.base)
        .environment(\.colorScheme, .dark)

        VStack(alignment: .leading, spacing: 12) {
            Text("standard").foregroundStyle(.black.opacity(0.5))
            HairlineDivider()
            Text("subtle").foregroundStyle(.black.opacity(0.5))
            HairlineDivider(intensity: .subtle)
            Text("faint").foregroundStyle(.black.opacity(0.5))
            HairlineDivider(intensity: .faint)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Theme.default.colors.base)
        .environment(\.colorScheme, .light)
    }
    .frame(height: 240)
}
