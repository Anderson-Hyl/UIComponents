import Foundation

public struct RadiusTokens: Sendable {
    public var shell: CGFloat
    public var card: CGFloat
    public var tile: CGFloat
    public var sidebarRow: CGFloat
    public var iconButton: CGFloat
    public var actionRow: CGFloat
    public var letterBadge: CGFloat
    public var brandMark: CGFloat
    public var keyCap: CGFloat
    public var inputChip: CGFloat
    public var primaryButton: CGFloat
    public var kindChip: CGFloat
    public var statusPill: CGFloat
    public var ghostBadge: CGFloat
    public var thumbBar: CGFloat

    public init(
        shell:         CGFloat = 16,
        card:          CGFloat = 14,
        tile:          CGFloat = 9,
        sidebarRow:    CGFloat = 7,
        iconButton:    CGFloat = 7,
        actionRow:     CGFloat = 6,
        letterBadge:   CGFloat = 5.5,
        brandMark:     CGFloat = 5,
        keyCap:        CGFloat = 5,
        inputChip:     CGFloat = 10,
        primaryButton: CGFloat = 7,
        kindChip:      CGFloat = 3,
        statusPill:    CGFloat = 9,
        ghostBadge:    CGFloat = 8,
        thumbBar:      CGFloat = 2
    ) {
        self.shell = shell
        self.card = card
        self.tile = tile
        self.sidebarRow = sidebarRow
        self.iconButton = iconButton
        self.actionRow = actionRow
        self.letterBadge = letterBadge
        self.brandMark = brandMark
        self.keyCap = keyCap
        self.inputChip = inputChip
        self.primaryButton = primaryButton
        self.kindChip = kindChip
        self.statusPill = statusPill
        self.ghostBadge = ghostBadge
        self.thumbBar = thumbBar
    }
}

extension RadiusTokens {
    public static let `default` = RadiusTokens()
}
