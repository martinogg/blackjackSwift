//
//  BlackjackRouterTests.swift
//  BlackjackTests
//
//  Created by martin ogg on 15/03/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import XCTest

class BlackjackRouterTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAttachViewModel() {
        let mockViewController = BlackjackViewController()
        
        BlackjackRouter.attachViewModel(to: mockViewController);
        
        XCTAssert(mockViewController.viewModel != nil)
        
        guard let viewConrollerOfviewModel = mockViewController.viewModel?.viewController as? BlackjackViewController else {
            XCTFail()
            return
        }
        
        XCTAssert(viewConrollerOfviewModel == mockViewController)
    }
    
}
