//
//  UserDefaultsService.swift
//
//
//  Created by Jalal Najafi.
//  Copyright © 2018  . All rights reserved.
//

import Foundation

class UserDefaultsService {
    static let shared = UserDefaultsService()
    private let userDefault = UserDefaults.standard
    //****
    // MARK: - token -
    //****
    func setToken(token: String) {
        userDefault.set(token, forKey: "token")
    }
    func getToken() -> String? {
        return userDefault.string(forKey: "token")
    }
    func removeToken() {
        userDefault.removeObject(forKey: "token")
    }
    func setUserId(userId: String) {
        userDefault.set(userId, forKey: "userId")
    }
    func getUserId() -> String? {
        return userDefault.string(forKey: "userId")
    }
    func removeUserId() {
        userDefault.removeObject(forKey: "userId")
    }
    func setUserName(userId: String) {
        userDefault.set(userId, forKey: "username")
    }
    func getUserName() -> String? {
        return userDefault.string(forKey: "username")
    }
    func removeUserName() {
        userDefault.removeObject(forKey: "username")
    }
    
}
