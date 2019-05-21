//
//  Errors.swift
//
//
//  Created by Jalal Najafi.
//  Copyright © 2018  . All rights reserved.
//


import Foundation
/////////////////////////
// MARK: - Errors
////////////////////////
struct Errors {
    private init() {}
}
extension Errors {
    
    enum Remote: Error {
        case noNetworkConnectivity
        case connectionTimeout
        case unAuthorized(data: Data?)
        case forbiden
        case notFound(data: Data?)
        case badRequest(data: Data?)
        case serverUnAvailable
        case maintenance
        case unKnownError(statusCode: Int)
    }
}

extension Errors.Remote: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .noNetworkConnectivity, .unKnownError:
            return "No internet connection"
        case .connectionTimeout:
            return "Connection time out"
        case .unAuthorized(let data):
            return serverError(withData: data, orDefault: "You are not authorized")
        case .notFound(let data):
            return serverError(withData: data, orDefault: "Not Found")
        case .badRequest(let data):
            return serverError(withData: data, orDefault: "Bad Request")
        case .serverUnAvailable:
            return "Server is temprory out of reach"
        case .forbiden:
            return "forbidden"
        case .maintenance:
            return "maintenance"
        }
    }
    
    private func serverError(withData data: Data?, orDefault: String) -> String {
        guard let data = data,
            let backendError: ErrorResponseMessage = try? data.decode() else {
                return orDefault
        }
        return backendError.Message ?? ""
    }
    
}
