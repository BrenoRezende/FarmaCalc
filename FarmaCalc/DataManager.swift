//
//  DataManager.swift
//  FarmaCalc
//
//  Created by Breno Rezende on 20/06/21.
//

import Foundation
import RealmSwift

class DataManager {
    
    private let realm: Realm
    
    static var shared: DataManager? = {
        return DataManager()
    }()
    
    private init?() {
        do {
            self.realm = try Realm()
        } catch {
            return nil
        }
    }
    
    func get<T: Object>(ofType type: T.Type) -> [T] {
        return Array(realm.objects(type.self))
    }
    
    func get<T: Object>(ofType type: T.Type, forPrimaryKey pk: Any) -> T? {
        return realm.object(ofType: type.self, forPrimaryKey: pk)
    }
    
    func write<T: Object>(object: T) {
        do {
            try realm.write {
                realm.add(object)
            }
        } catch let error {
            debugPrint("Error trying to WRITE realm task (\(object): \(error.localizedDescription)")
        }
    }
    
    func update<T: Object>(object: T, forPrimaryKey pk: Any) {
        do {
            if var oldObject = get(ofType: T.self, forPrimaryKey: pk) {
                try realm.write {
                    oldObject = object
                    debugPrint("\(oldObject) updated")
                }
            }
        } catch let error {
            debugPrint("Error trying to UPDATE realm task (\(object): \(error.localizedDescription)")
        }
    }
    
    func delete<T: Object>(object: T) {
        do {
            try realm.write {
                realm.delete(object)
            }
        } catch let error {
            debugPrint("Error trying to DELETE realm task (\(object): \(error.localizedDescription)")
        }
    }
}
