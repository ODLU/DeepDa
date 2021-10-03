//
//  ContentType.swift
//  DeepDa
//
//  Created by WANKI KIM on 2021/10/03.
//

import Foundation

enum ContentType: CustomStringConvertible {
    static let fieldID = "Content-Type"
    case json

    var description: String {
        switch self {
        case .json:
            return "application/json"
        }
    }
}
