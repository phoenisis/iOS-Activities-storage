// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "ActivitiesStorage",
  platforms: [
    .iOS(.v13)
  ],
  products: [
    .library(
      name: "ActivitiesStorage",
      targets: ["ActivitiesStorage"]),
  ],
  dependencies: [
    .package(url: "https://github.com/squadeasy/iOS-SQRealmStorage", .upToNextMajor(from: "0.0.1"))
  ],
  targets: [
    .target(
      name: "ActivitiesStorage",
      dependencies: [.product(name: "SQRealmStorage", package: "iOS-SQRealmStorage")]),
  ],
  swiftLanguageVersions: [.v5]
)
