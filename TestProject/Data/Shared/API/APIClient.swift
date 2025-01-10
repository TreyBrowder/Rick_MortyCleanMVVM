//
//  APIClient.swift
//  TestProject
//
//  Created by Trey on 1/9/25.
//

import Foundation

protocol APIClient {
    func fetchData<T: Decodable>(as type: T.Type, with endpoint: String) async throws -> T
}

extension APIClient {
    func fetchData<T: Decodable>(as type: T.Type, with endpoint: String) async throws -> T {
        guard let url = URL(string: endpoint) else { throw APIError.invalidUrl(urlStr: endpoint) }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let res = response as? HTTPURLResponse else { throw APIError.requestFailed(msg: "Failed to get Response") }
        guard  (200...299).contains(res.statusCode) else { throw APIError.invalidStatusCode(code: res.statusCode) }
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw error as? APIError ?? .unknownError(error: error)
        }
    }
}
