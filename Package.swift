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
            url: "https://github.com/Weelorum/WeeDeeplinkKit/releases/download/1.0.2/WeeDeeplinkKit.xcframework.zip",
            checksum: "740586227b6b5c4b48ee2072363761b01820d69f8918224d01f8303b4701b2be"
        )
    ]
)
