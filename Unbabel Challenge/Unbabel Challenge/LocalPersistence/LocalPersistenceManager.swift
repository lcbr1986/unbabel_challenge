//
//  LocalPersistenceManager.swift
//  Unbabel Challenge
//
//  Created by Luís Rosa on 09/09/2019.
//  Copyright © 2019 Luís Rosa. All rights reserved.
//

import Foundation

class LocalPersistenceManager: StorageInterface {
    
    let userDefaults: UserDefaults
    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }
    
    func getStoredItems(type: StorageTypes, completion: @escaping ([Any]?) -> Void) {
        
        switch type {
        case .posts:
            guard let storage = readValue(forKey: type) as [Post]? else {
                completion(nil)
                return
            }
            completion(storage)
            return
        default:
            return
        }
        
    }

    func storeItems(type: StorageTypes, items: [Any]) {
        saveValue(forKey: type, value: items)
    }
    
    private func saveValue(forKey key: StorageTypes, value: [Any]) {
        switch key {
        case .posts:
            if let posts = value as? [Post] {
                userDefaults.set(try? PropertyListEncoder().encode(posts), forKey:key.rawValue)
            }
            return
        default:
            return
        }
    }
    private func readValue<T>(forKey key: StorageTypes) -> T? {
        if let data = userDefaults.value(forKey: key.rawValue) as? Data {
            switch key {
            case .posts:
                return try? PropertyListDecoder().decode(Array<Post>.self, from: data) as? T
            default:
                return nil
            }
        }
        return nil
    }
}
