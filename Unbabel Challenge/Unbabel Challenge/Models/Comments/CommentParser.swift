//
//  CommentParser.swift
//  Unbabel Challenge
//
//  Created by Luís Rosa on 09/09/2019.
//  Copyright © 2019 Luís Rosa. All rights reserved.
//

import Foundation

struct CommentParser {
    static func parseComments(unparsedComments: [[String: Any]]) -> [Comment] {
        var comments: [Comment] = []
        for unparsedComment in unparsedComments {
            if let postId = unparsedComment["postId"] as? Int,
                let id = unparsedComment["id"] as? Int,
                let name = unparsedComment["name"] as? String,
                let email = unparsedComment["email"] as? String,
                let body = unparsedComment["body"] as? String
            {
                let comment = Comment(postId: postId, id: id, name: name, email: email, body: body)
                comments.append(comment)
            }
            
        }
        return comments
    }
}
