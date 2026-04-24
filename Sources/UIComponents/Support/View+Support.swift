import SwiftUI

extension View {
    public func hairline(_ color: Color, edge: Edge, width: CGFloat = 0.5) -> some View {
        overlay(alignment: edge.alignment) {
            Rectangle()
                .fill(color)
                .frame(
                    width:  (edge == .leading || edge == .trailing) ? width : nil,
                    height: (edge == .top     || edge == .bottom)   ? width : nil
                )
        }
    }

    public func innerStroke(
        _ color: Color,
        width: CGFloat = 0.5,
        cornerRadius: CGFloat
    ) -> some View {
        overlay(
            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                .strokeBorder(color, lineWidth: width)
        )
    }
}

extension Edge {
    fileprivate var alignment: Alignment {
        switch self {
        case .top:      .top
        case .leading:  .leading
        case .bottom:   .bottom
        case .trailing: .trailing
        }
    }
}
