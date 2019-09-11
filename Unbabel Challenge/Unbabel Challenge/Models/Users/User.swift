//
//  User.swift
//  Unbabel Challenge
//
//  Created by Luís Rosa on 09/09/2019.
//  Copyright © 2019 Luís Rosa. All rights reserved.
//

import Foundation

struct User: Equatable, Codable {
    
    var id: Int
    var name: String
    var username: String
    var email: String
    
    init(id: Int, name: String, email: String, username: String) {
        self.id = id
        self.name = name
        self.email = email
        self.username = username
    }
}
