// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "OptionalDesugaring",
    products: [
        .library(
            name: "OptionalDesugaring",
            targets: ["OptionalDesugaring"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "OptionalDesugaring",
            dependencies: []),
        .testTarget(
            name: "OptionalDesugaringTests",
            dependencies: ["OptionalDesugaring"]),
    ]
)
