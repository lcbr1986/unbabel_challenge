//
//  ViewController.swift
//  Unbabel Challenge
//
//  Created by Luís Rosa on 05/09/2019.
//  Copyright © 2019 Luís Rosa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let dataFetcher = DataFetcher()
    var posts: [Post] = []
    let cellReuseIdentifier = "cell"
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getPosts()
    }
    
    func getPosts() {
        dataFetcher.tryLocalStorage(type: .posts) { (posts, error) in
            if let error = error {
                debugPrint("There was an error: \(error.localizedDescription)")
//                SHOW ERROR ALERT
            } else {
                guard let posts = posts as? [Post] else {
//                    Show error alert
                    return
                }
                self.assignPosts(posts: posts)
            }
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
// MARK: - Navigation
extension ViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            let detailViewController = segue.destination as! DetailViewController
            let index = self.tableView.indexPathForSelectedRow?.row ?? 0
            detailViewController.post = self.posts[index]
        }
    }
}
