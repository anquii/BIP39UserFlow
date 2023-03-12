// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "BIP39UserFlow",
    defaultLocalization: "en",
    platforms: [
        .iOS("16.1")
    ],
    products: [
        .library(
            name: "BIP39UserFlow",
            targets: ["BIP39UserFlow"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/anquii/BIP39.git",
            exact: "2.0.1"
        )
    ],
    targets: [
        .target(
            name: "BIP39UserFlow",
            dependencies: ["BIP39"]
        ),
        .testTarget(
            name: "BIP39UserFlowTests",
            dependencies: ["BIP39UserFlow"]
        )
    ]
)
