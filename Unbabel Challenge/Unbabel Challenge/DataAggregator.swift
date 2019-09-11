//
//  DataAgregator.swift
//  Unbabel Challenge
//
//  Created by Luís Rosa on 11/09/2019.
//  Copyright © 2019 Luís Rosa. All rights reserved.
//

import UIKit

class DataAggregator {
    let dataFetcher = DataFetcher()
    var users: [User] = []
    var comments: [Comment] = []
    
    func loadData(completion: @escaping (Error?) -> Void) {
        dataFetcher.getItems(type: .users) { (users, error) in
            if let error = error {
                debugPrint("There was an error: \(error.localizedDescription)")
                completion(error)
            } else {
                guard let users = users as? [User] else {
                    completion(NSError())
                    return
                }
                self.users = users
                self.dataFetcher.getItems(type: .comments, completion: { (comments, error) in
                    if let error = error {
                        debugPrint("There was an error: \(error.localizedDescription)")
                        completion(error)
                    } else {
                        guard let comments = comments as? [Comment] else {
                            completion(NSError())
                            return
                        }
                        self.comments = comments
                        completion(nil)
                    }
                })
            }
        }
    }
    
    func getPostDetails(post: Post) -> (author: User, commentsCount: Int) {
        
        return(User(id: 0, name: "ble", email: "bla", username: "bla"), 0)
    }
}
