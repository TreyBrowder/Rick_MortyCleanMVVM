//
//  TestProjectApp.swift
//  TestProject
//
//  Created by Trey on 1/8/25.
//

import SwiftUI

@main
struct TestProjectApp: App {
    private let resolver = ServiceResolver()
    
    init() {
        
        //Register service that conforms to API Client
        resolver.register(type: APIClient.self) {
            PersonRepositoryImpl()
        }
        
        //Register Person Repository
        resolver.register(type: RickMortyRepositoryProtocol.self) {
            PersonRepositoryImpl()
        }
        
        //Register ViewModel
        resolver.register(type: PersonVM.self) { [weak resolver] in
            guard let resolver = resolver else { fatalError("Resolver is nil") }
            return PersonVM(service: resolver.resolve(type: GetAllPeopleUseCaseProtocol.self))
        }
        
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(personVM: resolver.resolve(type: PersonVM.self))
        }
    }
}
