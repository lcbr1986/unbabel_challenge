//
//  StorageInterface.swift
//  Unbabel Challenge
//
//  Created by Luís Rosa on 09/09/2019.
//  Copyright © 2019 Luís Rosa. All rights reserved.
//

import Foundation

protocol StorageInterface {
    func getStoredItems(type: StorageTypes, completion: @escaping([Any]?) -> Void)
    func storeItems(type: StorageTypes, items: [Any])
}

enum StorageTypes: String {
    case posts = "posts"
    case users = "users"
    case comments = "comments"
}
