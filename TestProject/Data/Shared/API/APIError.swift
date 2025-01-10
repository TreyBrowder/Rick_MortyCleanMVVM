//
//  APIError.swift
//  TestProject
//
//  Created by Trey on 1/9/25.
//

import Foundation

enum APIError: Error {
    case invalidUrl(urlStr: String)
    case requestFailed(msg: String)
    case invalidStatusCode(code: Int)
    case JSONParseError
    case unknownError(error: Error)
    
    var errorDescription: String {
        switch self {
        case .invalidUrl(urlStr: let urlStr):
            return "DEBUG - LOG: Invalid URL - \(urlStr)"
        case .requestFailed(msg: let msg):
            return "DEBUG - LOG: Request failed: \(msg)"
        case .invalidStatusCode(code: let code):
            return "DEBUG - LOG: Invalid status code: \(code)"
        case .JSONParseError:
            return "DEBUG - LOG: JSON parse error"
        case .unknownError(error: let error):
            return "DEBUG - LOG: Unknown Error has occured: \(error.localizedDescription)"
        }
    }
}
