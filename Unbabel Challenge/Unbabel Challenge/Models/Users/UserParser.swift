//
//  UserParser.swift
//  Unbabel Challenge
//
//  Created by Luís Rosa on 09/09/2019.
//  Copyright © 2019 Luís Rosa. All rights reserved.
//

import Foundation

struct UserParser {
    static func parsePosts(unparsedUsers: [[String: Any]]) -> [User] {
        var users: [User] = []
        for unparsedUser in unparsedUsers {
            if let id = unparsedUser["id"] as? Int,
                let name = unparsedUser["name"] as? String,
                let username = unparsedUser["username"] as? String,
                let email = unparsedUser["email"] as? String
            {
                let user = User(id: id, name: name, email: email, username: username)
                users.append(user)
            }
            
        }
        return users
    }
}
