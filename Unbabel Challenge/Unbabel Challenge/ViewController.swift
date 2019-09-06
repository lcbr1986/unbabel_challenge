//
//  ViewController.swift
//  Unbabel Challenge
//
//  Created by Luís Rosa on 05/09/2019.
//  Copyright © 2019 Luís Rosa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let networkController = NetworkController(network: NetworkCommunicator(baseUrl: "https://jsonplaceholder.typicode.com"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        networkController.network.makeGETRequest(url: .posts) { (data, error) in
            
        }
    }


}

