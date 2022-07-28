# iOS-Activities-storage

[![IDE](https://img.shields.io/badge/Xcode-13-blue.svg)](https://developer.apple.com/xcode/)
[![Language](https://img.shields.io/badge/swift-5.6-blue.svg?style=flat)](https://swift.org/download/)
[![Platform](https://img.shields.io/badge/iOS-13-Blue.svg)](https://developer.apple.com/ios/)

# Installation (SPM)

```swift
.package(url: "https://github.com/squadeasy/iOS-Activities-storage", .upToNextMajor(from: "0.0.1"))
```

# Import

```swift
import ActivitiesStorage
```


# Available functions
```swift
func saveTrackerActivities(_ trackerActivities: SQSTrackerActivities)
func getTrackerActivities() -> SQSTrackerActivities?
```


# Models

### SQSTrackerActivities
```swift
struct SQSTrackerActivities {
  public let sections        : [SQSSection]
  public let activities      : [SQSActivity]
  public let mobilityReasons : [SQSMobilityReason]
}
```
### SQSActivity
```swift 
struct SQSActivity {
  public let id                : String
  public let name              : String
  public let sectionID         : String
  public let iconURL           : String?
  public let type              : String
  public let mobilityReasonIDS : [String]
}
```
### SQSMobilityReason 
```swift 
struct SQSMobilityReason {
  public let id                        : String
  public let name                      : String
  public let mobilityReasonDescription : String?
  public let sectionsIDOrdered         : [String]
}
```
### SQSSection
```swift 
struct SQSSection {
  public let id           : String
  public let name         : String
  public let iconURL      : String?
  public let defaultOrder : Int
}
```
