//
//  UserPlayGamestateTests.swift
//  BlackjackTests
//
//  Created by martin ogg on 18/03/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import XCTest

class UserPlayGamestateTests: XCTestCase {
    
    let gamestateToTest = UserPlayGamestate()
    let mockViewModel = MockViewModel()
    let mockUserViewModel = MockUserViewModel()
        
    override func setUp() {
        super.setUp()
        gamestateToTest.blackjackViewModel = mockViewModel
        gamestateToTest.userViewModel = mockUserViewModel
        mockViewModel.deck.resetDeck()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testOnEnterState() {
        mockUserViewModel.playerName = "aName"
        
        let testOnEnterStateExpectation = expectation(description: "testOnEnterStateExpectation")
        
        mockViewModel.updateStatusTextCallback = { text in
            testOnEnterStateExpectation.fulfill()
            XCTAssert(text == "aName to play")
        }
        
        gamestateToTest.onEnterState()
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testHitButtonPress() {
        
        let userViewModelGiveFuncCalled = expectation(description: "userViewModelGiveFuncCalled")
        // Firstly, check to see that the user will be given a card
        
        mockUserViewModel.giveCallBack = {
            userViewModelGiveFuncCalled.fulfill()
        }
        
        gamestateToTest.hitButtonPress()
        
        mockUserViewModel.giveCallBack = nil
        
        // Secondly, check that if the score gets above 21, that it will end the turn of the player.
        // Every hitButton adds a Jack, so it will hit on a score of 30
        
        let bustScoreEndExpectation = expectation(description: "bustScoreEndExpectation")
        
        mockViewModel.endCurrentStateCallback = {
            bustScoreEndExpectation.fulfill()
        }
        
        gamestateToTest.hitButtonPress()
        gamestateToTest.hitButtonPress()
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testStandButtonPress() {
        let endCurrentStateCallbackExpectation = expectation(description: "endCurrentStateCallbackExpectation")
        mockViewModel.endCurrentStateCallback = {
            endCurrentStateCallbackExpectation.fulfill()
        }
        
        gamestateToTest.standButtonPress()
        
        waitForExpectations(timeout: 5, handler: nil)
    }
}
