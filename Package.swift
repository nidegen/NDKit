// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "NDKit",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "NDKit",
            targets: ["NDKit"]),
    ],
    targets: [
        .target(
            name: "NDKit",
            dependencies: [],
            path: "Source"),
    ]
)
