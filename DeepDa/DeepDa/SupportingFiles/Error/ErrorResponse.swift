//
//  ErrorResponse.swift
//  DeepDa
//
//  Created by WANKI KIM on 2021/10/03.
//

import Foundation

struct ErrorResponse: Decodable, LocalizedError {
    let reason: String
    var errorDescription: String? { return reason }
}
