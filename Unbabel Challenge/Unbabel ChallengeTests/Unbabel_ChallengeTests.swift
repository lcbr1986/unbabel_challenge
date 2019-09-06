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

    func testParsePostResponse() {
        viewController.getPosts { (data, error) in
            XCTAssertEqual(data?.count, 4)
        }
        
    }

}
