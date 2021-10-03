//
//  HttpMethod.swift
//  DeepDa
//
//  Created by WANKI KIM on 2021/10/03.
//

import Foundation


enum HttpMethod: CustomStringConvertible {
    case get
    case post
    case patch
    case delete
    
    var description: String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .patch:
            return "PATCH"
        case .delete:
            return "DELETE"
        }
    }
}
