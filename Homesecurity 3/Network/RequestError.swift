//
//  RequestError.swift
//  Homesecurity 3
//
//  Created by lester on 2025/3/3.
//

import Foundation

enum RequestError: Error {
    case invalidURL
    case encodingError
    case networkError(Error)
    case invalidResponse
    case noData
    case decodingError(Error)
    case unauthorized
    case clientError(Int)
    case serverError(Int)
    case unknown
    
    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .encodingError:
            return "Error encoding request data"
        case .networkError(let error):
            return "Network error: \(error.localizedDescription)"
        case .invalidResponse:
            return "Invalid response from server"
        case .noData:
            return "No data received from server"
        case .decodingError(let error):
            return "Error decoding response: \(error.localizedDescription)"
        case .unauthorized:
            return "Unauthorized access"
        case .clientError(let code):
            return "Client error with status code: \(code)"
        case .serverError(let code):
            return "Server error with status code: \(code)"
        case .unknown:
            return "Unknown error occurred"
        }
    }
}
