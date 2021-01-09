//
//  PeopleResult.swift
//  API
//
//  Created by Алик on 24.12.2020.
//

import Foundation

struct PeopleResult {
    var name: String?
    var height: String?
    var mass: String?
    var hairColor: String?
    var skinColor: String?
    var eyeColor: String?
    var birthYear: String?
    var gender: String?
    var homeworld: String?
//    var films: [String]?
//    var species: [String]?
//    var vehicles: [String]?
//    var starships: [String]?
    var created: String?
    var edited: String?
    var url: String?
    
    init(realmModel: PeopleRealmModel) {
        self.name = realmModel.name
        self.height = realmModel.height
        self.mass = realmModel.mass
        
        self.hairColor = realmModel.hairColor
        self.skinColor = realmModel.skinColor
        self.eyeColor = realmModel.eyeColor
        self.birthYear = realmModel.birthYear
        self.gender = realmModel.gender
        self.homeworld = realmModel.homeworld
        
//        self.films = realmModel.films
//        self.species = realmModel.species
//        self.vehicles = realmModel.vehicles
//        self.starships = realmModel.starships
        
        self.created = realmModel.created
        self.edited = realmModel.edited
        self.url = realmModel.url
    }
}

extension PeopleResult: Codable {
    enum CodingKeys: String, CodingKey {
        case name, height, mass
        case hairColor = "hair_color"
        case skinColor = "skin_color"
        case eyeColor = "eye_color"
        case birthYear = "birth_year"
        case gender, homeworld
//        case films, species, vehicles, starships
        case created, edited, url
    }
}
