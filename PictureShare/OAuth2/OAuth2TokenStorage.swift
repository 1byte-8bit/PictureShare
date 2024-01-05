//
//  OAuth2TokenStorage.swift
//  PictureShare
//
//  Created by Alexandr on 20.10.2023.
//

import Foundation

final class OAuth2TokenStorage {
    
    static let shared = OAuth2TokenStorage()
    
    var token: String? {
        get {
            return UserDefaults.standard.string(forKey: "token")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "token")
        }
    }
    
    private init() { }
}
