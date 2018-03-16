//
//  BlackjackViewControllerTests.swift
//  BlackjackTests
//
//  Created by martin ogg on 16/03/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import XCTest

class BlackjackViewControllerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testViewDidLoad() {
        let vcToTest = BlackjackViewController()
        let dealerView = UIPlayerView()
        vcToTest.dealerView = dealerView
        let userView = UIPlayerView()
        vcToTest.userView = userView

        vcToTest.viewDidLoad()
        
        //This test dont belong here, but the existence of the viewModel in here shows the router was called
        XCTAssert(vcToTest.viewModel != nil)
        
        //TODO TEST NOTE: view model's viewDidLoad is not tested yet. because I can't mock the viewModel
    }
}
