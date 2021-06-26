//
//  Request.swift
//  classifai-frontend
//
//  Created by Allen Gu on 6/26/21.
//

import Foundation

struct Request<T: Codable>: Codable {
    var statusCode: Int?
    var headers: Dictionary<String, String>?
    var body: T
}
