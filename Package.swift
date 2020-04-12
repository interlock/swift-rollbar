// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "Rollbar",
    products: [
        .library(name: "Rollbar", targets: ["Rollbar"]),
    ],
    dependencies: [
        .package(url: "https://github.com/swift-server/async-http-client.git", from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-nio.git", from: "2.0.0")
    ],
    targets: [
        .target(
            name: "Rollbar",
            dependencies: ["AsyncHTTPClient", "NIO", "NIOHTTP1"]),
        .testTarget(
            name: "RollbarTests",
            dependencies: ["Rollbar"]),
    ]
)
