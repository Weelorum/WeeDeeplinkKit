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
            checksum: "584a4452d30e021141bccc7a3ae2dafdf08fef0d0f8bae76ba8d26cefb40b008"
        )
    ]
)
