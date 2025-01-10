//
//  ServiceResolver.swift
//  TestProject
//
//  Created by Trey on 1/10/25.
//

import Foundation

final class ServiceResolver {
    private var serviceContainer = [String: Any]()
    
    //Register services
    func register<T>(type: T.Type, factory: @escaping () -> T) {
        let key = String(describing: type)
        serviceContainer[key] = factory
    }
    
    func resolve<T>( type: T.Type) -> T {
        let key = String(describing: type)
        
        guard let service = serviceContainer[key]  as? () -> T else {
            fatalError("No service registered for \(key)")
        }
        
        return service()
    }
}
