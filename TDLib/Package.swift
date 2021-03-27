// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "TDLib",
    platforms: [.watchOS(.v6)],
    products: [
        .library(
            name: "TDLib",
            targets: ["TDLib"]),
    ],
    targets: [
        .target(
            name: "TDLib",
            dependencies: ["TDLibCore"]),
        .binaryTarget(
            name: "TDLibCore",
            url: "https://gist.github.com/kkmoskalenko/6840fe2bf67ce89764f312def3e1d911/raw/39175b4a1e4c625612d834a1cee8aaf39c552510/TDLibCore.xcframework.zip",
            checksum: "33ffdc74b45dc008dfb69e5e4494ed0d81aa0309eab78f85a22718e86b83245f"),
    ]
)
