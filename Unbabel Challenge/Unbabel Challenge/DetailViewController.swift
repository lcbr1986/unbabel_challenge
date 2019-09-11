//
//  DetailViewController.swift
//  Unbabel Challenge
//
//  Created by Luís Rosa on 09/09/2019.
//  Copyright © 2019 Luís Rosa. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var post: Post?
    let dataAggregator = DataAggregator()
    var author: User? {
        didSet{
            if let name = author?.name {
                self.authorLabel.text = name
            }
        }
    }
    var commentsCount: Int? {
        didSet{
            if let commentsCount = commentsCount {
                self.commentCountLabel.text = "\(commentsCount) comments"
            }
        }
    }
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var commentCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.authorLabel.text = ""
        self.commentCountLabel.text = ""
        if let post = self.post {
            descriptionLabel.text = post.body
            self.title = post.title
        }
        
        dataAggregator.delegate = self
        dataAggregator.loadData()
    }
    
    func loadAuthorData() {
        print("Loaded author data")
        guard let post = self.post else {
            return
        }
        dataAggregator.getPostDetails(post: post)
    }
    
}

extension DetailViewController: DataAggregatorDelegate {
    func didGetPostDetails(author: User, commentsCount: Int) {
        self.author = author
        self.commentsCount = commentsCount
    }
    
    func didFinishLoad(error: Error?) {
        if let _ = error {
            // Show error
        } else {
            loadAuthorData()
        }
    }
    
    
}
