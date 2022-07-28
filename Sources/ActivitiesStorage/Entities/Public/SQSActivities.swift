//
//  File.swift
//  
//
//  Created by Quentin PIDOUX on 28/07/2022.
//

import Foundation

public struct SQSTrackerActivities {
  public let sections        : [SQSSection]
  public let activities      : [SQSActivity]
  public let mobilityReasons : [SQSMobilityReason]
  
  public init(sections        : [SQSSection],
              activities      : [SQSActivity],
              mobilityReasons : [SQSMobilityReason]) {
    self.sections        = sections
    self.activities      = activities
    self.mobilityReasons = mobilityReasons
  }
}
