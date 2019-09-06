//
//  Post.swift
//  Unbabel Challenge
//
//  Created by Luís Rosa on 06/09/2019.
//  Copyright © 2019 Luís Rosa. All rights reserved.
//

import UIKit

struct Post: Equatable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
    
    init(userId: Int, id: Int, title: String, body: String) {
        self.userId = userId
        self.id = id
        self.title = title
        self.body = body
    }
}
