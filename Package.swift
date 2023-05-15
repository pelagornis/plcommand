// swift-tools-version: 5.8
import PackageDescription

let package = Package(
    name: "PLCommand",
    platforms: [.macOS(.v10_15)],
    products: [
        .library(
            name: "PLCommand",
            targets: ["PLCommand"]),
    ],
    targets: [
        .target(
            name: "PLCommand",
            dependencies: []
        ),
        .testTarget(
            name: "PLCommandTests",
            dependencies: ["PLCommand"]
        ),
    ]
)
