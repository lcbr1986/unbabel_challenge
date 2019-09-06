//
//  NetworkMock.swift
//  Unbabel ChallengeTests
//
//  Created by Luís Rosa on 06/09/2019.
//  Copyright © 2019 Luís Rosa. All rights reserved.
//

import UIKit

class NetworkMock: NetworkInterface {
    var baseUrl: String = ""
    var returnError = false
    
    func makeGETRequest(url: RequestTypes, completion: ([[String: Any]]?, Error?) -> Void) {
        
    }
    

}
