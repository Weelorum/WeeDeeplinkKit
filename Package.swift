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
            checksum: "f52ac01189d2db5e6baae1f2bbe04f80c79e1bf31175b121ccf611095ab2998d"
        )
    ]
)
