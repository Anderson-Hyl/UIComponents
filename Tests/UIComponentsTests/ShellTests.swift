import Testing
import SwiftUI
@testable import UIComponents

@Suite("Shell")
@MainActor
struct ShellTests {
    @Test func shellComposesAllFourSlots() {
        _ = Shell {
            Sidebar { EmptyView() }
        } content: {
            Toolbar(title: "Title")
            TileGrid { EmptyView() }
        } trailing: {
            Inspector { EmptyView() }
        } overlay: {
            Drawer { EmptyView() }
        }
    }

    @Test func shellWithoutOverlayUsesEmptyView() {
        _ = Shell {
            Sidebar { EmptyView() }
        } content: {
            Toolbar(title: "No overlay")
        } trailing: {
            Inspector { EmptyView() }
        }
    }
}
