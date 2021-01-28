//
//  DatabaseManager.swift
//  API
//
//  Created by Алик on 09.01.2021.
//

import Foundation
import RealmSwift

class DatabaseManager {
    
    static let shared = DatabaseManager()

    private init() {}
    
    private lazy var realm = try! Realm()
    
    // Write
    func add(_ object: Object) {
        try! realm.write {
            self.realm.add(object, update: .modified)
        }
    }
    
    // Read
    func fetch<T: Object>() -> [T] {
        return Array(realm.objects(T.self))
    }
    
    // Delete
    func delete(_ object: Object) {
        try! realm.write {
            self.realm.delete(object)
        }
    }
    
    // Clear Database
    func clearDB() {
        try! realm.write {
            self.realm.deleteAll()
        }
    }
    
    // DB Configuration
    func configure() {
        Realm.Configuration.defaultConfiguration.deleteRealmIfMigrationNeeded = true
    }
}
