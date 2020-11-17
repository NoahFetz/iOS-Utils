// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "iOS Utils",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "iOS Utils",
            targets: ["iOS Utils"])
    ],
    targets: [
        .target(
            name: "iOS Utils"
        )
    ])
