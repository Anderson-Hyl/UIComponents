import Foundation

public struct Theme: Sendable {
    public var colors: ColorTokens
    public var typography: TypographyTokens
    public var radius: RadiusTokens
    public var spacing: SpacingTokens
    public var motion: MotionTokens
    public var elevation: ElevationTokens

    public init(
        colors:     ColorTokens      = .default,
        typography: TypographyTokens = .default,
        radius:     RadiusTokens     = .default,
        spacing:    SpacingTokens    = .default,
        motion:     MotionTokens     = .default,
        elevation:  ElevationTokens  = .default
    ) {
        self.colors = colors
        self.typography = typography
        self.radius = radius
        self.spacing = spacing
        self.motion = motion
        self.elevation = elevation
    }
}

extension Theme {
    public static let `default` = Theme()
}
