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
            checksum: "272abd43e2bdd492086de63b92868b3d610f5117fdba70b913cc2b92068e0d1d"
        )
    ]
)
