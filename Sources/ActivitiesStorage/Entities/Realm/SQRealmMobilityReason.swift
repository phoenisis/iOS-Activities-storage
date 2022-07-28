//
//  File.swift
//  
//
//  Created by Quentin PIDOUX on 28/07/2022.
//

import RealmSwift
import Foundation

open class SQRealmMobilityReason: Object {
  @Persisted(primaryKey: true) var id      : String
  @Persisted var name                      : String
  @Persisted var mobilityReasonDescription : String?
  @Persisted private var _sectionsIDOrdered: String?
  
  var sectionsIDOrdered : [String] {
    get {
      guard let dataString = _sectionsIDOrdered?.data(using: .utf8) else { return [] }
      let decodedData = try? JSONDecoder().decode([String].self, from: dataString)
      
      return decodedData ?? []
    }
    set {
      if let encodedData = try? JSONEncoder().encode(newValue) {
        _sectionsIDOrdered = String(data: encodedData, encoding: .utf8)
      } else {
        _sectionsIDOrdered = nil
      }
    }
  }

  convenience public init(id                        : String,
                          name                      : String,
                          mobilityReasonDescription : String?,
                          sectionsIDOrdered         : [String]) {
    self.init()

    self.id                        = id
    self.name                      = name
    self.mobilityReasonDescription = mobilityReasonDescription
    self.sectionsIDOrdered         = sectionsIDOrdered
  }
}


extension SQRealmMobilityReason {
  var toStorage: SQSMobilityReason {
    get {
      SQSMobilityReason(id                        : id,
                        name                      : name,
                        mobilityReasonDescription : mobilityReasonDescription,
                        sectionsIDOrdered         : sectionsIDOrdered)
    }
  }
}
