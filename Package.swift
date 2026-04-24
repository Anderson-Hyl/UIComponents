// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "UIComponents",
    platforms: [.iOS(.v26), .macOS(.v26)],
    products: [
        .library(name: "UIComponents", targets: ["UIComponents"]),
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing", from: "1.18.0"),
    ],
    targets: [
        .target(name: "UIComponents"),
        .testTarget(
            name: "UIComponentsTests",
            dependencies: [
                "UIComponents",
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing"),
            ],
            exclude: ["__Snapshots__"]
        ),
    ]
)
