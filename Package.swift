// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "iolapopenapiswift",
    platforms: [
        .iOS(.v16),
        .macCatalyst(.v16),
        .macOS(.v12),
        .watchOS(.v7),
        .tvOS(.v16),
    ],
    products: [
        .library(
            name: "iolapopenapiswift",
            targets: ["iolapopenapiswift"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/kean/Get", from: "2.0.0"),
        .package(url: "https://github.com/CreateAPI/URLQueryEncoder", from: "0.2.0"),
        .package(url: "https://github.com/CreateAPI/HTTPHeaders", .upToNextMajor(from: "0.1.1")),
    ],
    targets: [
        .target(
            name: "iolapopenapiswift",
            dependencies: [
                .product(name: "Get", package: "Get"),
                .product(name: "URLQueryEncoder", package: "URLQueryEncoder"),
                .product(name: "HTTPHeaders", package: "HTTPHeaders"),
            ],
            path: "Sources",
            exclude: ["PetStore.json",
                      "create-api-config.yaml"]
        ),
        .binaryTarget(
            name: "create-api",
            url: "https://github.com/CreateAPI/CreateAPI/releases/download/0.2.0/create-api.artifactbundle.zip",
            checksum: "6f8a3ce099f07eb2655ccaf6f66d8c9a09b74bb2307781c4adec36609ddac009"
        ),
        .plugin(
            name: "CreateAPI",
            capability: .command(
                intent: .custom(
                    verb: "generate-api",
                    description: "Generates the OpenAPI entities and paths using CreateAPI"
                ),
                permissions: [
                    .writeToPackageDirectory(reason: "To output the generated source code"),
                ]
            ),
            dependencies: [
                .target(name: "create-api"),
            ]
        ),
        .testTarget(
            name: "iolapopenapiswiftTests",
            dependencies: ["iolapopenapiswift"]
        ),
    ]
)
