//
//  GetAllPeople.swift
//  TestProject
//
//  Created by Trey on 1/9/25.
//

import Foundation

protocol GetAllPeopleUseCaseProtocol {
    func execute() async throws -> [PersonModel]
}

struct GetAllPeopleUseCaseImplementation: GetAllPeopleUseCaseProtocol {
    private let allPplRepoService: RickMortyRepositoryProtocol
    
    func execute() async throws -> [PersonModel] {
        print("Debug - Log: Get All People Use Case Impl. FIRED")
        do {
            let people = try await allPplRepoService.getAllPeople()
            print("Debug - Log: Get All People Use Case Impl. DONE")
            return people
        } catch {
            print("Debug - Log: Error occurred - Get All People Use Case Impl.")
            throw error as? APIError ?? .unknownError(error: error)
        }
    }
    
}
