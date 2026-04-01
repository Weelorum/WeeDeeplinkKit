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
            checksum: "b1118ae2003ee300efced5de3e8ed73fd920b406c4ae25ed33db95414af3193a"
        )
    ]
)
