// swift-tools-version:5.6
import PackageDescription
let package = Package(
    name: "WeeDeeplinkKit",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "WeeDeeplinkKit", targets: ["WeeDeeplinkKit"])
    ],
    targets: [
        .binaryTarget(
            name: "WeeDeeplinkKit",
            url: "https://github.com/Weelorum/WeeDeeplinkKit/releases/download/1.0.3/WeeDeeplinkKit.xcframework.zip",
            checksum: "39bd597c1e302796adcb6fe75c188261fa4d6c5c10e81d84e2c5a0f0f09631e7"
        )
    ]
)
