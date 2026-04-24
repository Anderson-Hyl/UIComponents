import SwiftUI

public struct MotionTokens: Sendable {
    public var rowHover: Animation
    public var iconButton: Animation
    public var tileHover: Animation
    public var ghostTile: Animation

    public init(
        rowHover:   Animation = .easeOut(duration: 0.08),
        iconButton: Animation = .easeOut(duration: 0.10),
        tileHover:  Animation = .easeOut(duration: 0.12),
        ghostTile:  Animation = .easeOut(duration: 0.10)
    ) {
        self.rowHover = rowHover
        self.iconButton = iconButton
        self.tileHover = tileHover
        self.ghostTile = ghostTile
    }
}

extension MotionTokens {
    public static let `default` = MotionTokens()
}
