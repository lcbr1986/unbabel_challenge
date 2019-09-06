//
//  ViewController.swift
//  Unbabel Challenge
//
//  Created by Luís Rosa on 05/09/2019.
//  Copyright © 2019 Luís Rosa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let network: NetworkCommunicator = NetworkCommunicator(baseUrl: "http://jsonplaceholder.typicode.com")
        
        network.makeGETRequest(url: "posts") { (data, error) in
            
        }
    }


}

