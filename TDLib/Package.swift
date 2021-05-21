// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "TDLib",
    platforms: [.watchOS(.v6)],
    products: [
        .library(
            name: "TDLib",
            targets: ["TDLib"]
        ),
    ],
    targets: [
        .target(
            name: "TDLib",
            dependencies: ["TDLibCore"]
        ),
        .binaryTarget(
            name: "TDLibCore",
            url: "https://github.com/kkmoskalenko/td/releases/download/v1.7.4/TDLibCore.xcframework.zip",
            checksum: "cc78e5023c33250758597ae3487daf8b97866fd484f4f86d83388a7a7c380002"
        ),
    ]
)
