//
//  File.swift
//  
//
//  Created by Quentin PIDOUX on 28/07/2022.
//

import Foundation

public struct SQSMobilityReason {
  public let id                        : String
  public let name                      : String
  public let mobilityReasonDescription : String?
  public let sectionsIDOrdered         : [String]
  
  public init(id                        : String,
              name                      : String,
              mobilityReasonDescription : String?,
              sectionsIDOrdered         : [String]) {
    self.id                        = id
    self.name                      = name
    self.mobilityReasonDescription = mobilityReasonDescription
    self.sectionsIDOrdered         = sectionsIDOrdered
  }
}

extension SQSMobilityReason {
  var toRealmStorage: SQRealmMobilityReason {
    get {
      SQRealmMobilityReason(id                        : id,
                            name                      : name,
                            mobilityReasonDescription : mobilityReasonDescription,
                            sectionsIDOrdered         : sectionsIDOrdered)
    }
  }
}
