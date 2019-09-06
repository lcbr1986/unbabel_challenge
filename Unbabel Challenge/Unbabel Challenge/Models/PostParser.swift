//
//  PostParser.swift
//  Unbabel Challenge
//
//  Created by Luís Rosa on 06/09/2019.
//  Copyright © 2019 Luís Rosa. All rights reserved.
//

import UIKit

struct PostParser {
    static func parsePosts(unparsedPosts: [[String: Any]]) -> [Post] {
        var posts: [Post] = []
        for unparsedPost in unparsedPosts {
            if let userId = unparsedPost["userId"] as? Int,
                let id = unparsedPost["id"] as? Int,
                let title = unparsedPost["title"] as? String,
                let body = unparsedPost["body"] as? String
            {
              let post = Post(userId: userId, id: id, title: title, body: body)
                posts.append(post)
            }
            
        }
        return posts
    }

}
