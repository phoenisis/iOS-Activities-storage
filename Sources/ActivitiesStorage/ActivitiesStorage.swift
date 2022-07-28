import Foundation
import SQRealmStorage
import RealmSwift

open class ActivitiesStorage: NSObject {
  private let realm = SQRealmStorage.shared.realm

  public override init() {}
  
  public func removeAll() {
    removeAllActivities()
    removeAllMobilityReasons()
    removeAllSections()
  }
  
  private func removeAllActivities() {
    let activities = realm.objects(SQRealmActivity.self)
    realm.delete(activities)
  }
  
  private func removeAllMobilityReasons() {
    let mobilityReasons = realm.objects(SQRealmMobilityReason.self)
    realm.delete(mobilityReasons)
  }
  
  private func removeAllSections() {
    let sections = realm.objects(SQRealmSection.self)
    realm.delete(sections)
  }
  
  public func deleteAll() {
    self.removeAll()
  }
  
  func save(activities: [SQRealmActivity]) {
    try? realm.write {
      realm.add(activities)
    }
  }
  
  func save(mobilityReasons: [SQRealmMobilityReason]) {
    try? realm.write {
      realm.add(mobilityReasons)
    }
  }
  
  func save(sections: [SQRealmSection]) {
    try? realm.write {
      realm.add(sections)
    }
  }
  
  func getActivities() -> [SQSActivity] {
    Array(realm.objects(SQRealmActivity.self))
      .map { $0.toStorage }
  }
  
  func getMobilityReasons() -> [SQSMobilityReason] {
    Array(realm.objects(SQRealmMobilityReason.self))
      .map { $0.toStorage }
  }
  
  func getSections() -> [SQSSection] {
    Array(realm.objects(SQRealmSection.self))
      .map { $0.toStorage }
  }
  
  public func saveTrackerActivities(_ trackerActivities: SQSTrackerActivities) {
    self.saveActivities(trackerActivities.activities)
    self.saveMobilityReasons(trackerActivities.mobilityReasons)
    self.saveMobilitySections(trackerActivities.sections)
  }
  
  func saveActivities(_ activities: [SQSActivity]) {
    self.removeAllActivities()
    self.save(activities: activities.map { $0.toRealmStorage })
  }
  
  func saveMobilityReasons(_ reasons: [SQSMobilityReason]) {
    self.removeAllMobilityReasons()
    self.save(mobilityReasons: reasons.map { $0.toRealmStorage })
  }
  
  func saveMobilitySections(_ sections: [SQSSection]) {
    self.removeAllSections()
    self.save(sections: sections.map { $0.toRealmStorage })
  }
  
  public func getTrackerActivities() -> SQSTrackerActivities? {
    let activities      = self.getActivities()
    let mobilityReasons = self.getMobilityReasons()
    let sections        = self.getSections()
    
    guard activities.isEmpty == false ||
            mobilityReasons.isEmpty == false ||
            sections.isEmpty == false else { return nil }
    
    return SQSTrackerActivities(sections        : sections,
                                activities      : activities,
                                mobilityReasons : mobilityReasons)
  }
}
