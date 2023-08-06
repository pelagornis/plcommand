// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "plcommand",
    platforms: [.macOS(.v10_15)],
    products: [
        .library(
            name: "PLCommand",
            targets: ["PLCommand"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-docc-plugin.git", from: "1.3.0")
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
