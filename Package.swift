// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "SmartQuotes",
    products: [
        .library(name: "SmartQuotes", type: .static, targets: ["SmartQuotes"])
    ],
    targets: [
        .target(name: "SmartQuotes", path: "Sources"),
        .testTarget(name: "SmartQuotesTests", dependencies: ["SmartQuotes"], path: "Tests")
    ]
)