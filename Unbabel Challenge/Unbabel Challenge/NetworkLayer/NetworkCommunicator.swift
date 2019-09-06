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
    
    func makeGETRequest(url: RequestTypes, completion: @escaping ([[String: Any]]?, Error?) -> Void) {
        let request = Alamofire.request(baseUrl + "/" + url.rawValue, method: .get)

        request.responseJSON { response in
            response.result.ifSuccess {
                guard let json = response.result.value as? [[String: Any]] else {
                    let error = NSError(domain: "", code: 100, userInfo: ["Error Message": "Parsing Error"])
                    completion(nil, error)
                    return
                }
                completion(json, nil)
            }
            response.result.ifFailure {
                completion(nil, response.result.error)
            }
        }
    }
}
