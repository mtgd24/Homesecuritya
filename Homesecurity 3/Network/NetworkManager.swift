//
//  NetworkManager.swift
//  Homesecurity 3
//
//  Created by lester on 2025/3/3.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    private let baseURL = "https://api.yourstartupapp.com/v1"
    
    func request<T: Decodable>(endpoint: APIEndpoint, completion: @escaping (Result<T, RequestError>) -> Void) {
        guard let url = URL(string: baseURL + endpoint.path) else {
            completion(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        
        // Add headers
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Add auth token if user is logged in
        if let token = KeychainManager.shared.getAuthToken() {
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        // Add request body if needed
        if let body = endpoint.body {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
            } catch {
                completion(.failure(.encodingError))
                return
            }
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(.networkError(error)))
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(.invalidResponse))
                return
            }
            
            switch response.statusCode {
            case 200...299:
                guard let data = data else {
                    completion(.failure(.noData))
                    return
                }
                
                do {
                    let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decodedResponse))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            case 401:
                completion(.failure(.unauthorized))
            case 400...499:
                completion(.failure(.clientError(response.statusCode)))
            case 500...599:
                completion(.failure(.serverError(response.statusCode)))
            default:
                completion(.failure(.unknown))
            }
        }
        
        task.resume()
    }
}
