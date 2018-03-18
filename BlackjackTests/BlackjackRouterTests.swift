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
        let dealerView = UIPlayerView();
        let userView = UIPlayerView();
        mockViewController.dealerView = dealerView
        mockViewController.userView = userView
        
        BlackjackRouter.attachViewModel(to: mockViewController);
        
        XCTAssert(mockViewController.viewModel != nil)
        
        guard let viewControllerOfviewModel = mockViewController.viewModel?.viewController as? BlackjackViewController else {
            XCTFail()
            return
        }
        
        XCTAssert(viewControllerOfviewModel == mockViewController)
        
        XCTAssert(mockViewController.dealerView.playerModel != nil)
        XCTAssert(mockViewController.userView.playerModel != nil)
        guard let dealerViewOfDealerPlayerModel = mockViewController.dealerView.playerModel?.view as? UIPlayerView,
            let userViewOfUserPlayerModel = mockViewController.userView.playerModel?.view as? UIPlayerView else {
                XCTFail()
                return
        }
        XCTAssert(dealerViewOfDealerPlayerModel == mockViewController.dealerView)
        XCTAssert(userViewOfUserPlayerModel == mockViewController.userView)
        
        guard let viewModel = mockViewController.viewModel else {
            XCTFail()
            return
        }
        XCTAssert(viewModel.userViewModel != nil)
        XCTAssert(viewModel.dealerViewModel != nil)
        XCTAssert(viewModel.router != nil)
    }
    
}
