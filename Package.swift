// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SCComponents",
    platforms: [
        .iOS(.v15),
        .macOS(.v12)
    ],
    products: [
        .library(
            name: "SCComponents",
            targets: ["SCComponents"]),
    ],
    dependencies: [
        // Optional: Uncomment to use SVG support directly
        // .package(url: "https://github.com/pocketsvg/PocketSVG.git", from: "2.0.0")
    ],
    targets: [
        .target(
            name: "SCComponents",
            dependencies: [
                // Add if using SVG library:
                // .product(name: "PocketSVG", package: "PocketSVG")
            ],
            resources: [
                .process("Assets"),
                .process("Icons")
            ]
        ),
        .testTarget(
            name: "SCComponentsTests",
            dependencies: ["SCComponents"]),
    ]
)
