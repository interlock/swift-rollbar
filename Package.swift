// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "Rollbar",
    products: [
        .library(name: "Rollbar", targets: ["Rollbar"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Rollbar",
            dependencies: []),
        .testTarget(
            name: "RollbarTests",
            dependencies: ["Rollbar"]),
    ]
)
