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

    let networkMock = NetworkMock()
    let storageMock = StorageMock()
    let viewController = ViewController()
    let dataFetcher = DataFetcher()
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        dataFetcher.setNetworkController(networkController: networkMock )
        dataFetcher.setLocalStorage(localStorage: storageMock)
        networkMock.makeRequest = false
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testGetPostsResponse() {
        dataFetcher.getNetworkItems(type: .posts) { (data, _) in
            XCTAssertEqual(data?.count, 4)
        }
    }
    
    func testGetCommentsResponse() {
        dataFetcher.getNetworkItems(type: .comments) { (data, _) in
            XCTAssertEqual(data?.count, 4)
        }
    }
    
    //    MARK: Parser tests
    
    func testParsePostsResponse() {
        dataFetcher.getNetworkItems(type: .posts) { (data, _) in
            guard let data = data else {
                XCTFail()
                return
            }
            let posts = PostParser.parsePosts(unparsedPosts: data)
            XCTAssertEqual(posts.count, 4)
            XCTAssertEqual(posts[0], Post(userId: 1, id: 1, title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit", body: "quia et suscipit suscipit recusandae consequuntur expedita et cum reprehenderit molestiae ut ut quas totam nostrum rerum est autem sunt rem eveniet architecto"))
        }
    }
    
    func testParseUserResponse() {
        dataFetcher.getNetworkItems(type: .users) { (data, _) in
            guard let data = data else {
                XCTFail()
                return
            }
            let users = UserParser.parsePosts(unparsedUsers: data)
            XCTAssertEqual(users.count, 2)
            XCTAssertEqual(users[0], User(id: 1, name: "Leanne Graham", email: "Sincere@april.biz", username: "Bret"))
        }
    }
    
    func testParseCommentResponse() {
        dataFetcher.getNetworkItems(type: .comments) { (data, _) in
            guard let data = data else {
                XCTFail()
                return
            }
            let comments = CommentParser.parseComments(unparsedComments: data)
            XCTAssertEqual(comments.count, 4)
            XCTAssertEqual(comments[0], Comment(postId: 1, id: 1, name: "id labore ex et quam laborum", email: "Eliseo@gardner.biz", body: "laudantium enim quasi est quidem magnam voluptate ipsam eos tempora quo necessitatibus dolor quam autem quasi reiciendis et nam sapiente accusantium"))
        }
    }
    
    //    MARK: Storage tests
    
    func testIfStorageIsEmptyShouldMakeNetworkCall() {
        storageMock.isEmpty = true
        dataFetcher.getItems(type: .posts) { (_, _) in }
        XCTAssert(networkMock.makeRequest)
    }
    
    func testIfStorageReturnsValuesNetworkCallIsNotMade() {
        storageMock.isEmpty = false
        dataFetcher.getItems(type: .posts) { (_, _) in }
        XCTAssertFalse(networkMock.makeRequest)
    }

}
