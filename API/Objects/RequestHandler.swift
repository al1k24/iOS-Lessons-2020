//
//  RequestHandler.swift
//  API
//
//  Created by Алик on 24.12.2020.
//
//

import Foundation
import Alamofire
import SwiftyJSON

struct RequestHandler {
    private let hostUrl = "http://swapi.dev/api/people/"
    private let path: String

    private var completeUrl: String {
        return hostUrl + path
    }

    init(path: String) {
        self.path = path
    }

    @discardableResult
    func responseJSON(_ closure: ((JSON) -> Void)?) -> RequestHandler {
        AF.request(completeUrl, method: .get)
            .responseData { (response) in
                if let data = response.data {
                    let json = (try? JSON(data: data)) ?? JSON()
                    closure?(json)
                } else {
                    closure?(JSON())
                }
            }
        return self
    }

    @discardableResult
    func response<T: Codable>(_ closure: ((T?) -> Void)?) -> RequestHandler {
        responseJSON { (json) in
            let finalJSON = json["results"]
            closure?(T.from(finalJSON))
        }
    }
}
