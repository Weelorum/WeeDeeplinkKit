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
            url: "https://github.com/Weelorum/WeeDeeplinkKit/releases/download/1.0.4/WeeDeeplinkKit.xcframework.zip",
            checksum: "7d2fcb429f17912e412618c513aa9186150f0f1309545f9c165744fae5b57f11"
        )
    ]
)
