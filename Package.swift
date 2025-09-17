// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "SampleTestFramework",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
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
