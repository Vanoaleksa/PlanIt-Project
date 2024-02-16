//
//  StorageManager.swift
//  PlanItProject
//
//  Created by MacBook on 13.02.24.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
    
    static func saveObject(_ item: Item) {
        try! realm.write({
            realm.add(item)
        })
    }
    
    static func deleteObject(_ item: Item) {
        try! realm.write({
            realm.delete(item)
        })
    }
}
