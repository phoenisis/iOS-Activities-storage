//
//  File.swift
//  
//
//  Created by Quentin PIDOUX on 28/07/2022.
//

import RealmSwift
import Foundation

open class SQRealmActivity: Object {
  @Persisted(primaryKey: true) var id       : String
  @Persisted var name                       : String
  @Persisted var sectionID                  : String
  @Persisted var iconURL                    : String?
  @Persisted var type                       : String
  @Persisted private var _mobilityReasonIDS : String?
  
  var mobilityReasonIDS: [String] {
    get {
      guard let dataString = _mobilityReasonIDS?.data(using: .utf8) else { return [] }
      let decodedData = try? JSONDecoder().decode([String].self, from: dataString)
      
      return decodedData ?? []
    }
    set {
      if let encodedData = try? JSONEncoder().encode(newValue) {
        _mobilityReasonIDS = String(data: encodedData, encoding: .utf8)
      } else {
        _mobilityReasonIDS = nil
      }
    }
  }

  convenience init(id                : String,
                   name              : String,
                   sectionID         : String,
                   iconURL           : String?,
                   type              : String,
                   mobilityReasonIDS : [String]) {
    self.init()

    self.id                = id
    self.name              = name
    self.sectionID         = sectionID
    self.iconURL           = iconURL
    self.type              = type
    self.mobilityReasonIDS = mobilityReasonIDS
  }
}

extension SQRealmActivity {
  var toStorage: SQSActivity {
    get {
      SQSActivity(id                : id,
                  name              : name,
                  sectionID         : sectionID,
                  iconURL           : iconURL,
                  type              : type,
                  mobilityReasonIDS : mobilityReasonIDS)
    }
  }
}
