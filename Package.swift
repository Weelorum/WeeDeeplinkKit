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
            url: "https://github.com/Weelorum/WeeDeeplinkKit/releases/download/1.0.1/WeeDeeplinkKit.xcframework.zip",
            checksum: "7c5a5c43d24d262e1733a5302b3068b560c386f15ab5741655bbad7e6be289ac"
        )
    ]
)
