import SwiftUI

public struct ResizableVSplit<Top: View, Bottom: View>: View {
    @Environment(\.theme) private var theme
    @Binding private var bottomHeight: CGFloat
    @State private var heightAtDragStart: CGFloat?

    private let minTop: CGFloat
    private let minBottom: CGFloat
    private let handleThickness: CGFloat
    private let top: Top
    private let bottom: Bottom

    public init(
        bottomHeight: Binding<CGFloat>,
        minTop: CGFloat = 80,
        minBottom: CGFloat = 80,
        handleThickness: CGFloat = 12,
        @ViewBuilder top: () -> Top,
        @ViewBuilder bottom: () -> Bottom
    ) {
        self._bottomHeight = bottomHeight
        self.minTop = minTop
        self.minBottom = minBottom
        self.handleThickness = handleThickness
        self.top = top()
        self.bottom = bottom()
    }

    public var body: some View {
        GeometryReader { proxy in
            let container = proxy.size.height
            let clamped = clamp(bottomHeight, container: container)

            VStack(spacing: 0) {
                top
                    .frame(maxHeight: .infinity)

                handle(container: container)

                bottom
                    .frame(height: clamped)
            }
        }
    }

    private func handle(container: CGFloat) -> some View {
        Rectangle()
            .fill(Color.clear)
            .frame(height: handleThickness)
            .contentShape(Rectangle())
            .overlay(
                Capsule()
                    .fill(theme.colors.primaryText.opacity(0.25))
                    .frame(width: 36, height: 4)
            )
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { splitterDragged($0, container: container) }
                    .onEnded  { _ in splitterDragEnded() }
            )
            #if os(iOS)
            .hoverEffect(.lift)
            #endif
    }

    private func splitterDragged(_ value: DragGesture.Value, container: CGFloat) {
        if heightAtDragStart == nil {
            heightAtDragStart = bottomHeight
        }
        let proposed = (heightAtDragStart ?? bottomHeight) - value.translation.height
        bottomHeight = clamp(proposed, container: container)
    }

    private func splitterDragEnded() {
        heightAtDragStart = nil
    }

    private func clamp(_ value: CGFloat, container: CGFloat) -> CGFloat {
        let maxBottom = max(minBottom, container - minTop - handleThickness)
        return min(maxBottom, max(minBottom, value))
    }
}
