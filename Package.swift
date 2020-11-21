// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Google IAP Challenge Handler",
    products: [
        .library(
            name: "GoogleIAPChallengeHandler",
            targets: ["GoogleIAPChallengeHandler"]
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
    ]
)
