// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "Synapse",
    platforms: [.iOS(.v16)],
    dependencies: [
        .package(url: "https://github.com/supabase/supabase-swift", from: "2.0.0"),
        .package(url: "https://github.com/kean/Nuke", from: "12.0.0"),
    ],
    targets: [
        .executableTarget(
            name: "Synapse",
            dependencies: [
                .product(name: "Supabase", package: "supabase-swift"),
                .product(name: "NukeUI", package: "Nuke"),
            ]
        )
    ]
)
