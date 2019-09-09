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
    var localStorage: StorageInterface = LocalPersistenceManager()
    var posts: [Post] = []
    let cellReuseIdentifier = "cell"
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tryLocalStorage()
    }
    
    func tryLocalStorage() {
        localStorage.getStoredItems(type: .posts) { (items) in
            guard let items = items as? [Post] else {
                self.makePostsCall()
                return
            }
            self.assignPosts(posts: items)
        }
    }
    
    func makePostsCall() {
        getPosts { (data, error) in
            if let error = error {
                debugPrint(error.localizedDescription)
            } else {
                guard let data = data else {
                    debugPrint("No data")
                    return
                }
                self.assignPosts(posts: PostParser.parsePosts(unparsedPosts: data))
            }
        }
    }

    func setNetworkController(networkController: NetworkInterface) {
        self.networkController = networkController
    }
    
    func setLocalStorage(localStorage: StorageInterface) {
        self.localStorage = localStorage
    }

    func getPosts(completion: @escaping([[String: Any]]?, Error?) -> Void) {
        networkController.makeGETRequest(url: .posts) { (data, error) in
            completion(data, error)
        }
    }
    
    func assignPosts(posts: [Post]) {
        self.posts = posts
        DispatchQueue.main.async {
            if (self.tableView != nil) {
                self.tableView.reloadData()
            }
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

