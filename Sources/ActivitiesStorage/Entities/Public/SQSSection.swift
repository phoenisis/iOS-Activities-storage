//
//  File.swift
//  
//
//  Created by Quentin PIDOUX on 28/07/2022.
//

import Foundation

public struct SQSSection {
  public let id           : String
  public let name         : String
  public let iconURL      : String?
  public let defaultOrder : Int
  
  public init(id           : String,
              name         : String,
              iconURL      : String?,
              defaultOrder : Int) {
    self.id           = id
    self.name         = name
    self.iconURL      = iconURL
    self.defaultOrder = defaultOrder
  }
}

extension SQSSection {
  var toRealmStorage: SQRealmSection {
    get {
      SQRealmSection(id           : id,
                     name         : name,
                     iconURL      : iconURL,
                     defaultOrder : defaultOrder)
    }
  }
}
