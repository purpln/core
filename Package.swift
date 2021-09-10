// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Core",
    platforms: [.iOS(.v10)],
    products: [.library(name: "Core", targets: ["Core"])],
    targets: [.target(name: "Core")]
)
