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
    var posts: [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        makeInitialCall()
        
    }
    
    func makeInitialCall() {
        getPosts { (data, error) in
            if let error = error {
                debugPrint(error.localizedDescription)
            } else {
                guard let data = data else {
                    debugPrint("No data")
                    return
                }
                self.posts = PostParser.parsePosts(unparsedPosts: data)
            }
        }
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

