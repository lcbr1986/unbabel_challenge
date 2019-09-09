//
//  StorageMock.swift
//  Unbabel ChallengeTests
//
//  Created by Luís Rosa on 09/09/2019.
//  Copyright © 2019 Luís Rosa. All rights reserved.
//

import UIKit
@testable import Unbabel_Challenge


class StorageMock: StorageInterface {
    
    var isEmpty = false
    func getStoredItems(type: StorageTypes, completion: @escaping ([Any]?) -> Void) {
        if isEmpty {
            completion(nil)
        }else {
            switch (type) {
            case .posts:
                completion([Post(userId: 0, id: 1, title: "Title", body: "Body")])
                return
            default:
                completion([])
            }
            
        }
    }
    
    func storeItems(type: StorageTypes, items: [Any]) {
        
    }
    
}
