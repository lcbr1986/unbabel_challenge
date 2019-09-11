//
//  DataFetcher.swift
//  Unbabel Challenge
//
//  Created by Luís Rosa on 09/09/2019.
//  Copyright © 2019 Luís Rosa. All rights reserved.
//

import UIKit

class DataFetcher {

    var networkController: NetworkInterface = NetworkCommunicator(baseUrl: "https://jsonplaceholder.typicode.com")
    var localStorage: StorageInterface = LocalPersistenceManager()
    
    func tryLocalStorage(type: StorageTypes, completion: @escaping ([Any]?) -> Void) {
        
        localStorage.getStoredItems(type: type) { (items) in
            switch type {
            case .posts:
                guard let items = items as? [Post] , items.count > 0 else {
                    self.makeCall(type: .posts, completion: completion)
                    return
                }
                completion(items)
                return
            case .comments:
                guard let items = items as? [Comment] , items.count > 0 else {
                    self.makeCall(type: .comments, completion: completion)
                    return
                }
                completion(items)
                return
            case .users:
                guard let items = items as? [User] , items.count > 0 else {
                    self.makeCall(type: .users, completion: completion)
                    return
                }
                completion(items)
                return
            }
        }
    }
    
    func makeCall(type: RequestTypes, completion: @escaping ([Any]?) -> Void) {
        getItems(type: type) { (data, error) in
            if let error = error {
                debugPrint(error.localizedDescription)
            } else {
                guard let data = data else {
                    debugPrint("No data")
                    return
                }
                switch type {
                case .posts:
                    let posts = PostParser.parsePosts(unparsedPosts: data)
                    self.localStorage.storeItems(type: .posts, items: posts)
                    completion(posts)
                    return
                case .comments:
                    let comments = CommentParser.parseComments(unparsedComments: data)
                    self.localStorage.storeItems(type: .comments, items: comments)
                    completion(comments)
                    return
                case .users:
                    let users = UserParser.parsePosts(unparsedUsers: data)
                    self.localStorage.storeItems(type: .users, items: users)
                    completion(users)
                    return
                }
            }
        }
    }
    
    func setNetworkController(networkController: NetworkInterface) {
        self.networkController = networkController
    }
    
    func setLocalStorage(localStorage: StorageInterface) {
        self.localStorage = localStorage
    }
    
    func getItems(type: RequestTypes, completion: @escaping([[String: Any]]?, Error?) -> Void) {
        networkController.makeGETRequest(url: .posts) { (data, error) in
            completion(data, error)
        }
    }
    
}
