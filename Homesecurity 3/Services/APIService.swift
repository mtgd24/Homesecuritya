//
//  APIService.swift
//  Homesecurity 3
//
//  Created by lester on 2025/3/3.
//

class APIService {
    static let shared = APIService()
    
    private init() {}
    
    // MARK: - Authentication API
    
    func login(email: String, password: String, completion: @escaping (Result<LoginResponse, RequestError>) -> Void) {
        NetworkManager.shared.request(endpoint: .login(email: email, password: password), completion: completion)
    }
    
    func signup(name: String, email: String, password: String, completion: @escaping (Result<LoginResponse, RequestError>) -> Void) {
        NetworkManager.shared.request(endpoint: .signup(email: email, password: password, name: name), completion: completion)
    }
    
    // MARK: - User Profile API
    
    func fetchUserProfile(completion: @escaping (Result<User, RequestError>) -> Void) {
        NetworkManager.shared.request(endpoint: .fetchUserProfile, completion: completion)
    }
    
    func updateUserProfile(name: String, bio: String, completion: @escaping (Result<User, RequestError>) -> Void) {
        NetworkManager.shared.request(endpoint: .updateUserProfile(name: name, bio: bio), completion: completion)
    }
    
    // MARK: - Dashboard API
    
    func getDashboardData(completion: @escaping (Result<DashboardData, RequestError>) -> Void) {
        NetworkManager.shared.request(endpoint: .getDashboardData, completion: completion)
    }
    
    // MARK: - Notifications API
    
    func getNotifications(completion: @escaping (Result<[Notification], RequestError>) -> Void) {
        NetworkManager.shared.request(endpoint: .getNotifications, completion: completion)
    }
}
