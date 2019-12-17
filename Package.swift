// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "QuotesDictionaryCreator",
    platforms: [.macOS(.v10_13)],
    dependencies: [.package(url: "https://github.com/scinfu/SwiftSoup.git", from: "2.2.2")],
    targets: [
        .target(name: "QuotesDictionaryCreator", dependencies: ["SwiftSoup"]),
        .testTarget(name: "QuotesDictionaryCreatorTests", dependencies: ["QuotesDictionaryCreator"]),
    ]
)
