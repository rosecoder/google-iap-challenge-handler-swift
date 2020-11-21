// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Google IAP Challenge Handler",
    platforms: [
        .macOS(.v10_12),
    ],
    products: [
        .library(
            name: "GoogleIAPChallengeHandler",
            targets: ["GoogleIAPChallengeHandler"]
        ),
        .executable(
            name: "Demo",
            targets: ["Demo"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "GoogleIAPChallengeHandler",
            dependencies: []
        ),
        .testTarget(
            name: "GoogleIAPChallengeHandlerTests",
            dependencies: ["GoogleIAPChallengeHandler"]
        ),
        .target(
            name: "Demo",
            dependencies: ["GoogleIAPChallengeHandler"]
        ),
    ]
)
