//
//  SavedStateTests.swift
//  BlackjackTests
//
//  Created by martin ogg on 19/03/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import XCTest

class SavedStateTests: XCTestCase {
    
    let savedState = SavedState()
    
    override func setUp() {
        super.setUp()
        UserDefaults.standard.removeObject(forKey: StateParam.gameCount.rawValue)
        UserDefaults.standard.removeObject(forKey: StateParam.userWins.rawValue)
        UserDefaults.standard.removeObject(forKey: StateParam.dealerWins.rawValue)
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testHasPreviousSavedState() {
        XCTAssert(savedState.hasPreviousSavedState == false)
        savedState.setState(gameCount: 1, userWins: 1, dealerWins: 1)
        XCTAssert(savedState.hasPreviousSavedState == true)
    }
    
    func testSetStateAndGetPreviousState() {
        let getPreviousStateExpectation1 = expectation(description: "getPreviousStateExpectation1")
        let getPreviousStateExpectation2 = expectation(description: "getPreviousStateExpectation1")
        
        savedState.setState(gameCount: 3, userWins: 2, dealerWins: 1)
        
        savedState.getPreviousState { (state) in
            getPreviousStateExpectation1.fulfill()
            XCTAssert(state.gameCount == 3)
            XCTAssert(state.userWins == 2)
            XCTAssert(state.dealerWins == 1)
        }

        savedState.setState(gameCount: 6, userWins: 4, dealerWins: 2)
        
        savedState.getPreviousState { (state) in
            getPreviousStateExpectation2.fulfill()
            XCTAssert(state.gameCount == 6)
            XCTAssert(state.userWins == 4)
            XCTAssert(state.dealerWins == 2)
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
}
