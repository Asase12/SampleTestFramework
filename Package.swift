// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "SampleTestFramework",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "SampleTestFramework",
            targets: ["TestSources"]
        ),
    ],
    targets: [
        .target(
            name: "TestSources",
            path: "TestSources"
        ),
        .target(
            name: "UITests",
            dependencies: ["TestSources"],
            path: "UITests"
        ),
    ]
)
