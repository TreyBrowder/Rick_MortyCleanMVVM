//
//  MapperService.swift
//  TestProject
//
//  Created by Trey on 1/10/25.
//

import Foundation

struct MapperService {
    static func mapToPersonModel(_ response: [Person]) -> [PersonModel] {
        return  response.map { PersonModel(name: $0.name, status: $0.status, img: $0.image) }
    }
}
