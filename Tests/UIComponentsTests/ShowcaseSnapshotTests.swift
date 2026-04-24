import Testing
import SwiftUI
import SnapshotTesting
@testable import UIComponents

@Suite("Showcase · Snapshots")
@MainActor
struct ShowcaseSnapshotTests {
    @Test func kyotoDark() {
        let view = KyotoPage()
            .environment(\.colorScheme, .dark)

        assertSnapshot(
            of: view,
            as: .image(layout: .fixed(width: 1280, height: 716))
        )
    }

    @Test func kyotoLight() {
        let view = KyotoPage()
            .environment(\.colorScheme, .light)

        assertSnapshot(
            of: view,
            as: .image(layout: .fixed(width: 1280, height: 716))
        )
    }
}
