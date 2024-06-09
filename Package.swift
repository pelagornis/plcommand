// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "plcommand",
    platforms: [.macOS(.v10_15)],
    products: [
        .library(
            name: "Command",
            targets: ["Command"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-docc-plugin.git", .upToNextMajor(from: "1.3.0")),
        .package(url: "https://github.com/apple/swift-log", .upToNextMajor(from: "1.5.4"))
    ],
    targets: [
        .target(
            name: "Command",
            dependencies: [
                .product(name: "Logging", package: "swift-log"),
            ]
        ),
        .testTarget(
            name: "CommandTests",
            dependencies: ["Command"]
        ),
    ]
)
