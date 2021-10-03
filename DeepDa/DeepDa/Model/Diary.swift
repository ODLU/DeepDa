//
//  Diary.swift
//  DeepDa
//
//  Created by WANKI KIM on 2021/10/03.
//

import Foundation

struct Diary: Codable, Responsable, Requestable {
    let title: String
    let context: String
    let date: Date
}
