# iolapopenapiswift

iOLAP OpenAPI Client Code Generation


To invoke the plugin (and generate code):

```bash
$ swift package --allow-writing-to-package-directory generate-api
```

Rename this function in : get/Response

    public func map<U>(_ closure: (T) throws -> U) rethrows -> Response<U> {
        Response<U>(value: try closure(value), data: data, response: response, task: task, metrics: metrics)
    }


## Using CreateAPI to Generate iOS Code

### Create a Swift Package

Initiate Swift package

```bash
mkdir PetstoreKit
cd PetstoreKit
swift package init --type library
```

### Download the desired Specs in OpenAPI format

```bash
curl "https://petstore3.swagger.io/api/v3/openapi.json" > PetStore.json
```

### Make a CreateAPI config file `create-api-config.yaml` and specify the name of you main package

```yml
module: PetstoreKit
# Modifier for all generated declarations
```

### Modify the `Package.swift`:

#### Add dependencies to `Get`, `URLQueryEncoder` and `HTTPHeaders`

```swift
    dependencies: [
        .package(url: "https://github.com/kean/Get", from: "2.0.0"),
        .package(url: "https://github.com/CreateAPI/URLQueryEncoder", from: "0.2.0"),
        .package(url: "https://github.com/CreateAPI/HTTPHeaders", .upToNextMajor(from: "0.1.1")),
    ],
    ...
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
```

#### Change the package file to use `create-api` as a binary target

```swift
        .binaryTarget(
            name: "create-api",
            url: "https://github.com/CreateAPI/CreateAPI/releases/download/0.2.0/create-api.artifactbundle.zip",
            checksum: "6f8a3ce099f07eb2655ccaf6f66d8c9a09b74bb2307781c4adec36609ddac009"
        ),
```

### For further code modification is needed, write a Swift package plugin

Command plugin resides in `Plugins/GenerateAPI/Plugin.swift`
The method to implement
```swift
struct Plugin: CommandPlugin {
    func performCommand(context: PluginContext, arguments _: [String]) async throws {
        // implement this
    }
```

To invoke the plugin (and generate code):

```bash
swift package --allow-writing-to-package-directory generate-api
```

This command generates code:

```bash
Sources/
│
├── Entities/
│   ├── Address.swift
│   ├── APIResponse.swift
│   ├── Category.swift
│   ├── Customer.swift
│   ├── Order.swift
│   ├── Pet.swift
│   ├── Tag.swift
│   └── User.swift
│
├── Extensions/
│   ├── Paths.swift
│   └── StringCodingKey.swift
│
├── PetstoreKit/
│   └── PetstoreKit.swift
│
├── Paths/
│   ├── PathsPetAPI.swift
│   ├── PathsPetFindByStatusAPI.swift
│   ├── PathsPetFindByTagsAPI.swift
│   ├── PathsPetWithPetIDAPI.swift
│   ├── PathsPetWithPetIDUploadImageAPI.swift
│   ├── PathsStoreAPI.swift
│   ├── PathsStoreInventoryAPI.swift
│   ├── PathsStoreOrderAPI.swift
│   ├── PathsStoreOrderWithOrderIDAPI.swift
│   ├── PathsUserAPI.swift
│   ├── PathsUserCreateWithListAPI.swift
│   ├── PathsUserLoginAPI.swift
│   ├── PathsUserLogoutAPI.swift
│   └── PathsUserWithUsernameAPI.swift
│
├── create-api-config.yaml
└── PetStore.md
``` 
