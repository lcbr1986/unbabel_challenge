//
//  NetworkMock.swift
//  Unbabel ChallengeTests
//
//  Created by Luís Rosa on 06/09/2019.
//  Copyright © 2019 Luís Rosa. All rights reserved.
//

import UIKit
@testable import Unbabel_Challenge

class NetworkMock: NetworkInterface {
    var baseUrl: String = ""
    var returnError = false
    
    func makeGETRequest(url: RequestTypes, completion: ([[String: Any]]?, Error?) -> Void) {
        if returnError {
            let error = NSError(domain: "domain", code: 100, userInfo: nil)
            completion(nil, error)
        }
        completion(NetworkResponses.getResponse(responseType: url), nil)
    }
}
