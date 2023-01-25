// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "Gorge",
    products: [
        .library(
            name: "Gorge",
            targets: ["Gorge"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Gorge",
            dependencies: []
        ),
        .executableTarget(
            name: "GorgeExample",
            dependencies: [
                .target(name: "Gorge")
            ]
        ),
        .testTarget(
            name: "GorgeTests",
            dependencies: ["Gorge"]
        ),
    ]
)
