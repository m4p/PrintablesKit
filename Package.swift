// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "PrintablesKit",
    defaultLocalization: "en",
    platforms: [.iOS(.v14), .tvOS(.v14), .macOS(.v10_14)],
    products: [
        .library(
            name: "PrintablesKit",
            targets: ["PrintablesKit"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/apollographql/apollo-ios.git", .upToNextMinor(from: "1.2.1")),
        .package(url: "https://github.com/pointfreeco/swift-dependencies", .upToNextMajor(from: "0.5.1")),
    ],
    targets: [
        .target(
            name: "PrintablesKit",
            dependencies: [
                .product(name: "Apollo", package: "apollo-ios"),
                .product(name: "Dependencies", package: "swift-dependencies")
            ],
            exclude: ["ApolloCodegen"],
            swiftSettings: [
                .define("PRODUCTION", .when(configuration: .release)),
                .define("RELEASE", .when(configuration: .release)),
                .define("TESTFLIGHT", .when(configuration: .debug)),
                .define("DEBUG", .when(configuration: .debug))
            ]),
        .testTarget(
            name: "PrintablesKitTests",
            dependencies: ["PrintablesKit"]),
    ]
)
