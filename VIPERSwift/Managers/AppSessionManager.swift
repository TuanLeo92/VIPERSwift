//
//  AppSessionManager.swift
//  VIPERSwift
//
//  Created by Le Tuan on 30/7/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

import Foundation
import ObjectMapper

final class AppSessionManager {
    
    static let shared = AppSessionManager()
    let userDefaults = UserDefaults.standard
    
    enum SessionKey: String {
        case token, user
    }
    
}

// MARK: - Access Token
extension AppSessionManager {
    func saveNewAccessToken(_ token: String) {
        userDefaults.set(token, forKey: SessionKey.token.rawValue)
        userDefaults.synchronize()
    }
    
    func getAccessToken() -> String? {
        return userDefaults.string(forKey: SessionKey.token.rawValue)
    }
    
    func removeAccessToken() {
        userDefaults.set(nil, forKey: SessionKey.token.rawValue)
        userDefaults.synchronize()
    }
}

// MARK: - User
extension AppSessionManager {
    func saveNewUserJSON(_ userJson: JSONDictionary) {
        let encodedUserData: Data = NSKeyedArchiver.archivedData(withRootObject: userJson)
        userDefaults.set(encodedUserData, forKey: SessionKey.user.rawValue)
        userDefaults.synchronize()
    }
    
    func getUser() -> User? {
        guard let encodedUserData =  userDefaults.value(forKey: SessionKey.user.rawValue) as? Data,
            let userJson = NSKeyedUnarchiver.unarchiveObject(with: encodedUserData) as? JSONDictionary else {
                return nil
        }
        
        let user = User(JSON: userJson)
        return user
    }
    
    func removeUser() {
        userDefaults.set(nil, forKey: SessionKey.user.rawValue)
        userDefaults.synchronize()
    }
    
    func getUserId() -> String? {
        return getUser()?.id
    }
}


// MARK: - User Session
extension AppSessionManager {
    func isLogged() -> Bool {
        return getUser() != nil
    }
    
    func clearSession() {
        removeAccessToken()
        removeUser()
    }
}
