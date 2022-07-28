//
//  File.swift
//  
//
//  Created by Quentin PIDOUX on 28/07/2022.
//

import RealmSwift

class SQRealmSection: Object {
  @Persisted(primaryKey: true) var id : String
  @Persisted var name         : String
  @Persisted var iconURL      : String?
  @Persisted var defaultOrder : Int
  
  convenience init(id           : String,
                   name         : String,
                   iconURL      : String?,
                   defaultOrder : Int) {
    self.init()

    self.id           = id
    self.name         = name
    self.iconURL      = iconURL
    self.defaultOrder = defaultOrder
  }
}

extension SQRealmSection {
  var toStorage: SQSSection {
    get {
      SQSSection(id           : id,
                 name         : name,
                 iconURL      : iconURL,
                 defaultOrder : defaultOrder)
    }
  }
}
