// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ImagePreview",
    platforms: [.iOS(.v12)],
    products: [
        .library(name: "ImagePreview", targets: ["ImagePreview"]),
    ],
    targets: [
        .target(name: "ImagePreview"),
    ]
)
