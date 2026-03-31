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
            url: "https://github.com/Weelorum/WeeDeeplinkKitSource/releases/download/1.0.0/WeeDeeplinkKit.xcframework.zip",
            checksum: "038d91c84748bc5a9023b2885b87ab12de9524a6a0e7f20a99eac557b297326d"
        )
    ]
)
