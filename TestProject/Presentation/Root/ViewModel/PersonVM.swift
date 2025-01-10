//
//  PersonVM.swift
//  TestProject
//
//  Created by Trey on 1/9/25.
//

import Foundation

@Observable
class PersonVM {
    var personArr = [PersonModel]()
    var errMsg: String?
    
    @ObservationIgnored private let getAllPplUseCase: GetAllPeopleUseCaseProtocol
    
    init(service: GetAllPeopleUseCaseProtocol){
        self.getAllPplUseCase = service
    }
    
    @MainActor
    func getAllCharacter() async {
        do {
            let result = try await getAllPplUseCase.execute()
            personArr = result
        } catch {
            print("DEBUG - LOG: Get All Characters Error")
            guard let error = error as? APIError else { return }
            errMsg = error.errorDescription
            print(errMsg ?? "")
        }
    }
    
}




