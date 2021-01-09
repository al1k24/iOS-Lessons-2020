//
//  PeopleRealmModel.swift
//  API
//
//  Created by Алик on 09.01.2021.
//

import RealmSwift

class PeopleRealmModel: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var height: String = ""
    @objc dynamic var mass: String = ""
    @objc dynamic var hairColor: String = ""
    @objc dynamic var skinColor: String = ""
    @objc dynamic var eyeColor: String = ""
    @objc dynamic var birthYear: String = ""
    @objc dynamic var gender: String = ""
    @objc dynamic var homeworld: String = ""
//    @objc dynamic var films: [String] = [String]()
//    @objc dynamic var species: [String] = [String]()
//    @objc dynamic var vehicles: [String] = [String]()
//    @objc dynamic var starships: [String] = [String]()
    @objc dynamic var created: String = ""
    @objc dynamic var edited: String = ""
    @objc dynamic var url: String = ""
    
    @objc open override class func primaryKey() -> String? {
        return "name"
    }
    
//    @objc open override class func ignoredProperties() -> [String] {
//        return [ "films", "species", "vehicles", "starships" ]
//    }
}
