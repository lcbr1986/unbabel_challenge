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
    var users: [User] = []
    var comments: [Comment] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataAggregator.loadData { (error) in
            if let _ = error {
//                SHOW ERROR ALERT
            } else {
                self.loadAuthorData()
            }
        }
    }
    
    func loadAuthorData() {
        
    }
    
}
