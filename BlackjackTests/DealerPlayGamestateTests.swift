//
//  DealerPlayGamestateTests.swift
//  BlackjackTests
//
//  Created by martin ogg on 18/03/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import XCTest

class DealerPlayGamestateTests: XCTestCase {

    let gamestateToTest = DealerPlayGamestate()
    let mockViewModel = MockViewModel()
    let mockDealerViewModel = MockDealerViewModel()
    
    override func setUp() {
        super.setUp()
        gamestateToTest.blackjackViewModel = mockViewModel
        gamestateToTest.dealerViewModel = mockDealerViewModel
        mockViewModel.deck.resetDeck()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testOnEnterState() {
        mockDealerViewModel.playerName = "aName"
        
        let updateStatusTextCallbackExpectation = expectation(description: "updateStatusTextCallbackExpectation")
        
        mockViewModel.updateStatusTextCallback = {text in
            updateStatusTextCallbackExpectation.fulfill()
            XCTAssert(text == "aName to play")
        }
        
        let unHideFirstCardCallback = expectation(description: "unHideFirstCardCallback")
        mockDealerViewModel.unHideFirstCardCallback = {
            unHideFirstCardCallback.fulfill()
        }
        
        // TODO: Theres more tests required here -
        // dealerViewModel.give calls
        // update status text (2nd time round)
        // endCurrentState on an async delayed
        
        gamestateToTest.onEnterState()
        
        waitForExpectations(timeout: 5, handler: nil)
    }
}
