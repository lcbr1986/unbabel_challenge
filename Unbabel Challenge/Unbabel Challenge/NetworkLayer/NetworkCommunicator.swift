//
//  NetworkCommunicator.swift
//  Unbabel Challenge
//
//  Created by Luís Rosa on 06/09/2019.
//  Copyright © 2019 Luís Rosa. All rights reserved.
//

import UIKit
import Alamofire

class NetworkCommunicator: NetworkInterface {
    var baseUrl: String
    
    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    func makeGETRequest(url: String, completion: (Data?, Error?) -> Void) {
        
    }
    

}
