//
//  ViewController.swift
//  Unbabel Challenge
//
//  Created by Luís Rosa on 05/09/2019.
//  Copyright © 2019 Luís Rosa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var networkController: NetworkInterface = NetworkCommunicator(baseUrl: "https://jsonplaceholder.typicode.com")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    func setNetworkController(networkController: NetworkInterface) {
        self.networkController = networkController
    }

    func getPosts(completion: @escaping([[String: Any]]?, Error?) -> Void) {
        networkController.makeGETRequest(url: .posts) { (data, error) in
            completion(data, error)
        }
    }
}

