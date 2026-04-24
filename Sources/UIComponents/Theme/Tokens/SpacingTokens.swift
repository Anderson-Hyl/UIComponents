import Foundation

public struct SpacingTokens: Sendable {
    public var shellHeight: CGFloat
    public var sidebarWidth: CGFloat
    public var inspectorWidth: CGFloat

    public var canvasPadding: CGFloat
    public var canvasGap: CGFloat

    public var toolbarHeight: CGFloat
    public var toolbarHorizontal: CGFloat
    public var toolbarGap: CGFloat

    public var sidebarVertical: CGFloat
    public var sidebarHorizontal: CGFloat
    public var sidebarRowVertical: CGFloat
    public var sidebarRowHorizontal: CGFloat
    public var sidebarRowGap: CGFloat

    public var drawerHeight: CGFloat
    public var drawerTop: CGFloat
    public var drawerHorizontal: CGFloat
    public var drawerBottom: CGFloat
    public var drawerGap: CGFloat

    public var inspectorVertical: CGFloat
    public var inspectorHorizontal: CGFloat
    public var inspectorFieldVertical: CGFloat
    public var inspectorFieldGap: CGFloat
    public var inspectorActionsTop: CGFloat
    public var inspectorActionsGap: CGFloat

    public init(
        shellHeight:            CGFloat = 620,
        sidebarWidth:           CGFloat = 228,
        inspectorWidth:         CGFloat = 260,
        canvasPadding:          CGFloat = 22,
        canvasGap:              CGFloat = 16,
        toolbarHeight:          CGFloat = 42,
        toolbarHorizontal:      CGFloat = 18,
        toolbarGap:             CGFloat = 10,
        sidebarVertical:        CGFloat = 14,
        sidebarHorizontal:      CGFloat = 10,
        sidebarRowVertical:     CGFloat = 6.5,
        sidebarRowHorizontal:   CGFloat = 10,
        sidebarRowGap:          CGFloat = 10,
        drawerHeight:           CGFloat = 160,
        drawerTop:              CGFloat = 14,
        drawerHorizontal:       CGFloat = 18,
        drawerBottom:           CGFloat = 16,
        drawerGap:              CGFloat = 10,
        inspectorVertical:      CGFloat = 18,
        inspectorHorizontal:    CGFloat = 16,
        inspectorFieldVertical: CGFloat = 10,
        inspectorFieldGap:      CGFloat = 10,
        inspectorActionsTop:    CGFloat = 16,
        inspectorActionsGap:    CGFloat = 6
    ) {
        self.shellHeight = shellHeight
        self.sidebarWidth = sidebarWidth
        self.inspectorWidth = inspectorWidth
        self.canvasPadding = canvasPadding
        self.canvasGap = canvasGap
        self.toolbarHeight = toolbarHeight
        self.toolbarHorizontal = toolbarHorizontal
        self.toolbarGap = toolbarGap
        self.sidebarVertical = sidebarVertical
        self.sidebarHorizontal = sidebarHorizontal
        self.sidebarRowVertical = sidebarRowVertical
        self.sidebarRowHorizontal = sidebarRowHorizontal
        self.sidebarRowGap = sidebarRowGap
        self.drawerHeight = drawerHeight
        self.drawerTop = drawerTop
        self.drawerHorizontal = drawerHorizontal
        self.drawerBottom = drawerBottom
        self.drawerGap = drawerGap
        self.inspectorVertical = inspectorVertical
        self.inspectorHorizontal = inspectorHorizontal
        self.inspectorFieldVertical = inspectorFieldVertical
        self.inspectorFieldGap = inspectorFieldGap
        self.inspectorActionsTop = inspectorActionsTop
        self.inspectorActionsGap = inspectorActionsGap
    }
}

extension SpacingTokens {
    public static let `default` = SpacingTokens()
}
