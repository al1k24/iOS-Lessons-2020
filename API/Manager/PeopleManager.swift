//
//  PoepleManager.swift
//  API
//
//  Created by Алик on 24.12.2020.
//

import Foundation

class PeopleManager {
    
    static let shared = PeopleManager()
    
    private init() {}
    
    func fetchPeople(byPage number: Int, closure: (([PeopleResult]?) -> Void)?) {
        RequestHandler(path: "?page=\(number)")
            .response { (model: [PeopleResult]?) in
                closure?(model)
            }
    }
}
