//
//  DataAgregator.swift
//  Unbabel Challenge
//
//  Created by Luís Rosa on 11/09/2019.
//  Copyright © 2019 Luís Rosa. All rights reserved.
//

import UIKit

protocol DataAggregatorDelegate {
    func didFinishLoad(error: Error?)
}

class DataAggregator {
    let dataFetcher = DataFetcher()
    var users: [User] = []
    var comments: [Comment] = []
    var delegate: DataAggregatorDelegate?
    
    func loadData() {
        dataFetcher.getItems(type: .users) { (users, error) in
            if let error = error {
                debugPrint("There was an error: \(error.localizedDescription)")
                self.delegate?.didFinishLoad(error: error)
            } else {
                guard let users = users as? [User] else {
                    self.delegate?.didFinishLoad(error: NSError())
                    return
                }
                self.users = users
            }
        }
        dataFetcher.getItems(type: .comments, completion: { (comments, error) in
            if let error = error {
                debugPrint("There was an error: \(error.localizedDescription)")
                self.delegate?.didFinishLoad(error: error)
            } else {
                guard let comments = comments as? [Comment] else {
                    self.delegate?.didFinishLoad(error: NSError())
                    return
                }
                self.comments = comments
            }
        })
        self.delegate?.didFinishLoad(error: nil)
    }
    
    func getPostDetails(post: Post) -> (author: User, commentsCount: Int) {
        let author = findAuthor(authorId: post.userId)
        return(author, self.comments.count)
    }
    
    func findAuthor(authorId: Int) -> User {
        
        return User(id: 0, name: "ble", email: "bla", username: "bla")
    }
}
