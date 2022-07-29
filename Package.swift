// swift-tools-version: 5.6

import PackageDescription

let package = Package(
  name: "SearchableList",
  platforms: [.iOS(.v15)],
  products: [
    .library(
      name: "SearchableList",
      targets: ["SearchableList"]),
  ],
  dependencies: [
    .package(
      name: "SnapshotTesting",
      url: "https://github.com/pointfreeco/swift-snapshot-testing",
      from: "1.9.0"
    )
  ],
  targets: [
    .target(
      name: "SearchableList",
      dependencies: []
    ),
    .testTarget(
      name: "SearchableListTests",
      dependencies: ["SearchableList", "SnapshotTesting"],
      exclude: [
        "__Snapshots__"
      ]
    ),
  ]
)
