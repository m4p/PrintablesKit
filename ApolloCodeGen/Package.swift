// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "ApolloCodegen",
    platforms: [
        .macOS(.v10_14)
    ],
    dependencies: [
        // The actual Apollo library
        .package(url: "https://github.com/apollographql/apollo-ios.git",
                 /// Make sure this version matches the version in your iOS project!
                 .upToNextMinor(from: "1.2.1")),

        // The official Swift argument parser.
        .package(url: "https://github.com/apple/swift-argument-parser.git",
                 .upToNextMinor(from: "1.2.2")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .executableTarget(
            name: "ApolloCodegen",
            dependencies: [
                .product(name: "ApolloCodegenLib", package: "apollo-ios"),
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ])
    ]
)
