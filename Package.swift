// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "PLCommand",
    platforms: [.macOS(.v10_15)],
    products: [
        .library(
            name: "PLCommand",
            targets: ["PLCommand"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "PLCommand",
            dependencies: []
        ),
        .executableTarget(
            name: "PLCommandExample",
            dependencies: [
                .target(name: "PLCommand")
            ]
        ),
        .testTarget(
            name: "PLCommandTests",
            dependencies: ["PLCommand"]
        ),
    ]
)
