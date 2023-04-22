// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NavigationLargeTitleSwiftUI",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "NavigationLargeTitleSwiftUI",
            targets: ["NavigationLargeTitleSwiftUI"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "NavigationLargeTitleSwiftUI",
            dependencies: []
        )
    ]
)
