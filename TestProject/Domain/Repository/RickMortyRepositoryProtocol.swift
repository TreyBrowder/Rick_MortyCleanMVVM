//
//  RickMortyRepositoryProtocol.swift
//  TestProject
//
//  Created by Trey on 1/9/25.
//

import Foundation

protocol RickMortyRepositoryProtocol {
    func getAllPeople() async throws -> [PersonModel]
}
