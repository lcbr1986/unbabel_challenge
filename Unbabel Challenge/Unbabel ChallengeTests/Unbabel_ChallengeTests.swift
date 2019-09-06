//
//  Unbabel_ChallengeTests.swift
//  Unbabel ChallengeTests
//
//  Created by Luís Rosa on 05/09/2019.
//  Copyright © 2019 Luís Rosa. All rights reserved.
//

import XCTest
@testable import Unbabel_Challenge

class Unbabel_ChallengeTests: XCTestCase {

    let networkMock: NetworkInterface = NetworkMock() as NetworkInterface
    let viewController = ViewController()
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewController.setNetworkController(networkController: networkMock )
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetPostsResponse() {
        viewController.getPosts { (data, _) in
            XCTAssertEqual(data?.count, 4)
        }
    }
    
    func testParsePostsResponse() {
        viewController.getPosts { (data, _) in
            guard let data = data else {
                XCTFail()
                return
            }
            let posts = PostParser.parsePosts(unparsedPosts: data)
            XCTAssertEqual(posts.count, 4)
            XCTAssertEqual(posts[0], Post(userId: 1, id: 1, title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit", body: "quia et suscipit suscipit recusandae consequuntur expedita et cum reprehenderit molestiae ut ut quas totam nostrum rerum est autem sunt rem eveniet architecto"))
        }
    }

}
