//
//  NetworkInterface.swift
//  Unbabel Challenge
//
//  Created by Luís Rosa on 06/09/2019.
//  Copyright © 2019 Luís Rosa. All rights reserved.
//

import Foundation

protocol NetworkInterface {
    var baseUrl: String { get }
    func makeGETRequest(url: RequestTypes, completion: @escaping([[String: Any]]?, Error?) -> Void)
}

enum RequestTypes: String {
    case posts = "posts"
    case users = "users"
    case comments = "comments"
}
