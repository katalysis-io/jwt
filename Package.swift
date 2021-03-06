// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "jwt",
    platforms: [
       .macOS(.v10_15)
    ],
    products: [
        .library(name: "JWT", targets: ["JWT"]),
    ],
    dependencies: [
        .package(url: "https://github.com/katalysis-io/jwt-kit.git", .exact("4.0.1-katalysis.9")),
        .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0"),
    ],
    targets: [
        .target(name: "JWT", dependencies: [
            .product(name: "JWTKit", package: "jwt-kit"),
            .product(name: "Vapor", package: "vapor"),
        ]),
        .testTarget(name: "JWTTests", dependencies: [
            .target(name: "JWT"),
            .product(name: "XCTVapor", package: "vapor"),
        ]),
    ]
)
