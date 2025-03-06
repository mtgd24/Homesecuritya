//
//  APIEndpoint.swift
//  Homesecurity 3
//
//  Created by lester on 2025/3/3.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    case patch = "PATCH"
}

enum APIEndpoint {
    case login(email: String, password: String)
    case signup(email: String, password: String, name: String)
    case fetchUserProfile
    case updateUserProfile(name: String, bio: String)
    case getDashboardData
    case getNotifications
    
    var path: String {
        switch self {
        case .login:
            return "/auth/login"
        case .signup:
            return "/auth/signup"
        case .fetchUserProfile:
            return "/user/profile"
        case .updateUserProfile:
            return "/user/profile"
        case .getDashboardData:
            return "/dashboard"
        case .getNotifications:
            return "/notifications"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .login, .signup:
            return .post
        case .fetchUserProfile, .getDashboardData, .getNotifications:
            return .get
        case .updateUserProfile:
            return .put
        }
    }
    
    var body: [String: Any]? {
        switch self {
        case .login(let email, let password):
            return ["email": email, "password": password]
        case .signup(let email, let password, let name):
            return ["email": email, "password": password, "name": name]
        case .updateUserProfile(let name, let bio):
            return ["name": name, "bio": bio]
        case .fetchUserProfile, .getDashboardData, .getNotifications:
            return nil
        }
    }
}
