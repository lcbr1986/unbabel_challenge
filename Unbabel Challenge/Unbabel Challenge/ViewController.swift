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
    let cellReuseIdentifier = "cell"
    
    @IBOutlet weak var tableView: UITableView!
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
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
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

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) ?? UITableViewCell()
        
        cell.textLabel?.text = self.posts[indexPath.row].title
        
        return cell
    }
    
    
}

