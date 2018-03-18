//
//  BlackjackRouterTests.swift
//  BlackjackTests
//
//  Created by martin ogg on 15/03/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import XCTest

class BlackjackRouterTests: XCTestCase {
    let routerToTest = BlackjackRouter()
    
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
        
        XCTAssert(viewModel.userViewModel?.playerName == "User")
        XCTAssert(viewModel.dealerViewModel?.playerName == "Dealer")
        
    }
    
    func testCreateGameStates() {
        let mockViewModel = BlackjackViewModel()
        let mockUserViewModel = UserViewModel()
        let mockDealerViewModel = DealerViewModel()
        mockViewModel.userViewModel = mockUserViewModel
        mockViewModel.dealerViewModel = mockDealerViewModel
        
        let returnedGameStates = routerToTest.createGameStates(with: mockViewModel)
        
        XCTAssert(returnedGameStates.count == 4)
        guard let newGameState = returnedGameStates[0] as? NewPlayGamestate,
            let userPlayGameState = returnedGameStates[1] as? UserPlayGamestate,
            let dealerPlayGameState = returnedGameStates[2] as? DealerPlayGamestate,
            let endPlayGameState = returnedGameStates[3] as? EndPlayGamestate else {
                XCTFail()
                return
        }
        
        XCTAssert(newGameState.blackjackViewModel === mockViewModel)
        XCTAssert(userPlayGameState.blackjackViewModel === mockViewModel)
        XCTAssert(dealerPlayGameState.blackjackViewModel === mockViewModel)
        XCTAssert(endPlayGameState.blackjackViewModel === mockViewModel)
        
        XCTAssert(newGameState.nextGamestate === userPlayGameState)
        XCTAssert(userPlayGameState.nextGamestate === dealerPlayGameState)
        XCTAssert(dealerPlayGameState.nextGamestate === endPlayGameState)
        XCTAssert(endPlayGameState.nextGamestate === newGameState)
        
        XCTAssert(newGameState.userViewModel != nil)
        XCTAssert(newGameState.dealerViewModel != nil)
        
        XCTAssert(userPlayGameState.userViewModel != nil)
        
        XCTAssert(dealerPlayGameState.dealerViewModel != nil)
        
        XCTAssert(endPlayGameState.userViewModel != nil)
        XCTAssert(endPlayGameState.dealerViewModel != nil)
    }
    
}
