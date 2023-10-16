// swift-tools-version: 5.6
import PackageDescription

let package = Package(
    name: "BuildTools",
    dependencies: [
        .package(url: "https://github.com/realm/SwiftLint", branch: "main")
    ],
    targets: [.target(name: "BuildTools", path: "")]
)
