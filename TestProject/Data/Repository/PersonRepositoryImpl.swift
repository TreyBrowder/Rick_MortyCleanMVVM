//
//  PersonRepositoryImpl.swift
//  TestProject
//
//  Created by Trey on 1/9/25.
//

import Foundation

actor PersonRepositoryImpl: RickMortyRepositoryProtocol, APIClient {
    var baseURL: URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "rickandmortyapi.com"
        components.path = "/api"
        return components
    }
    
    var getAllPeopleUrlStr: String? {
        var components = baseURL
        components.path += "/character"
        
        return components.url?.absoluteString
    }
    
    func getAllPeople() async throws -> [PersonModel] {
        guard let endpoint = getAllPeopleUrlStr else {
            throw APIError.invalidUrl(urlStr: "All People Url String Error")
        }
        
        let result = try await fetchData(as: PersonResponse.self, with: endpoint)
        return MapperService.mapToPersonModel(result.results)
    }
}
