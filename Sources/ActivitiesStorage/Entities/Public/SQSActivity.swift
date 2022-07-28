//
//  File.swift
//  
//
//  Created by Quentin PIDOUX on 28/07/2022.
//

import Foundation

public struct SQSActivity {
  public let id                : String
  public let name              : String
  public let sectionID         : String
  public let iconURL           : String?
  public let type              : String
  public let mobilityReasonIDS : [String]
  
  public init(id                : String,
              name              : String,
              sectionID         : String,
              iconURL           : String?,
              type              : String,
              mobilityReasonIDS : [String]) {
    self.id                = id
    self.name              = name
    self.sectionID         = sectionID
    self.iconURL           = iconURL
    self.type              = type
    self.mobilityReasonIDS = mobilityReasonIDS
  }
}

extension SQSActivity {
  var toRealmStorage: SQRealmActivity {
    get {
      SQRealmActivity(id                : id,
                      name              : name,
                      sectionID         : sectionID,
                      iconURL           : iconURL,
                      type              : type,
                      mobilityReasonIDS : mobilityReasonIDS)
    }
  }
}
