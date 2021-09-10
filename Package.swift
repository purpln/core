// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Core",
    platforms: [.iOS(.v10), .macOS(.v10_10), .tvOS(.v9), .watchOS(.v2)],
    products: [.library(name: "Core", targets: ["Core"])],
    dependencies: [],
    targets: [.target(name: "Core")]
)
