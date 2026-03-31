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
            url: "https://github.com/Weelorum/WeeDeeplinkKit/releases/download/1.0.0/WeeDeeplinkKit.xcframework.zip",
            checksum: "262e4be33af286efb11c58c925afcebf3c648a05ef2680b9ae89f430f31e0586"
        )
    ]
)
