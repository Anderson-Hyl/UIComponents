import SwiftUI

public struct TypographyTokens: Sendable {
    public var docTitle: TextStyle
    public var docSub: TextStyle
    public var modeLabel: TextStyle
    public var brandLabel: TextStyle

    public var sectionLabel: TextStyle
    public var rowName: TextStyle
    public var rowNameActive: TextStyle
    public var rowCount: TextStyle

    public var toolbarDocTitle: TextStyle
    public var toolbarMeta: TextStyle
    public var keyCap: TextStyle

    public var tileHeading: TextStyle
    public var tileHeadingSmall: TextStyle
    public var tileBody: TextStyle
    public var tileFooter: TextStyle
    public var tileKind: TextStyle
    public var ghostLabel: TextStyle

    public var drawerBar: TextStyle
    public var drawerMsg: TextStyle
    public var drawerInput: TextStyle
    public var drawerSend: TextStyle

    public var inspectorKey: TextStyle
    public var inspectorVal: TextStyle
    public var inspectorValSub: TextStyle
    public var inspectorAction: TextStyle

    public var statusText: TextStyle

    public init(
        docTitle:         TextStyle = TextStyle(font: .system(size: 22,   weight: .semibold),                 tracking: -0.3),
        docSub:           TextStyle = TextStyle(font: .system(size: 13),                                      lineSpacing: 5),
        modeLabel:        TextStyle = TextStyle(font: .system(size: 10.5, weight: .medium),                   tracking: 1.2, isUppercase: true),
        brandLabel:       TextStyle = TextStyle(font: .system(size: 13,   weight: .semibold),                 tracking: -0.2),

        sectionLabel:     TextStyle = TextStyle(font: .system(size: 10,   weight: .medium),                   tracking: 0.9, isUppercase: true),
        rowName:          TextStyle = TextStyle(font: .system(size: 12.5)),
        rowNameActive:    TextStyle = TextStyle(font: .system(size: 12.5, weight: .medium)),
        rowCount:         TextStyle = TextStyle(font: .system(size: 10.5).monospacedDigit()),

        toolbarDocTitle:  TextStyle = TextStyle(font: .system(size: 12.5, weight: .medium),                   tracking: -0.1),
        toolbarMeta:      TextStyle = TextStyle(font: .system(size: 11.5)),
        keyCap:           TextStyle = TextStyle(font: .system(size: 10.5, design: .monospaced),               tracking: 0.3),

        tileHeading:      TextStyle = TextStyle(font: .system(size: 16,   weight: .semibold),                 tracking: -0.2),
        tileHeadingSmall: TextStyle = TextStyle(font: .system(size: 11,   weight: .semibold)),
        tileBody:         TextStyle = TextStyle(font: .system(size: 8.5),                                     lineSpacing: 2),
        tileFooter:       TextStyle = TextStyle(font: .system(size: 10.5, weight: .medium),                   tracking: 0.1),
        tileKind:         TextStyle = TextStyle(font: .system(size: 9.5),                                     tracking: 0.4, isUppercase: true),
        ghostLabel:       TextStyle = TextStyle(font: .system(size: 10.5, weight: .medium),                   tracking: 0.4),

        drawerBar:        TextStyle = TextStyle(font: .system(size: 12)),
        drawerMsg:        TextStyle = TextStyle(font: .system(size: 12.5),                                    lineSpacing: 4),
        drawerInput:      TextStyle = TextStyle(font: .system(size: 12.5)),
        drawerSend:       TextStyle = TextStyle(font: .system(size: 11,   weight: .medium),                   tracking: 0.1),

        inspectorKey:     TextStyle = TextStyle(font: .system(size: 11)),
        inspectorVal:     TextStyle = TextStyle(font: .system(size: 11.5, weight: .medium)),
        inspectorValSub:  TextStyle = TextStyle(font: .system(size: 10)),
        inspectorAction:  TextStyle = TextStyle(font: .system(size: 11.5)),

        statusText:       TextStyle = TextStyle(font: .system(size: 11))
    ) {
        self.docTitle = docTitle
        self.docSub = docSub
        self.modeLabel = modeLabel
        self.brandLabel = brandLabel
        self.sectionLabel = sectionLabel
        self.rowName = rowName
        self.rowNameActive = rowNameActive
        self.rowCount = rowCount
        self.toolbarDocTitle = toolbarDocTitle
        self.toolbarMeta = toolbarMeta
        self.keyCap = keyCap
        self.tileHeading = tileHeading
        self.tileHeadingSmall = tileHeadingSmall
        self.tileBody = tileBody
        self.tileFooter = tileFooter
        self.tileKind = tileKind
        self.ghostLabel = ghostLabel
        self.drawerBar = drawerBar
        self.drawerMsg = drawerMsg
        self.drawerInput = drawerInput
        self.drawerSend = drawerSend
        self.inspectorKey = inspectorKey
        self.inspectorVal = inspectorVal
        self.inspectorValSub = inspectorValSub
        self.inspectorAction = inspectorAction
        self.statusText = statusText
    }
}

extension TypographyTokens {
    public static let `default` = TypographyTokens()
}
