//
//  PersonModels.swift
//  TestProject
//
//  Created by Trey on 1/9/25.
//

import Foundation

struct PersonResponse: Decodable {
    let info: ResponseData
    let results: [Person]
}

struct ResponseData: Decodable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}

struct Person: Decodable, Identifiable, Hashable {
    let id: Int
    let name: String
    let status: String
    let gender: String
    let image: String
}
