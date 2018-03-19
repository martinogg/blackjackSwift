//
//  AppStartGameStateTests.swift
//  BlackjackTests
//
//  Created by martin ogg on 19/03/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import XCTest

class AppStartGameStateTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testOnEnterState() {
        let stateToTest = AppStartGamestate()
        let mockModel = MockViewModel()
        
        let showRestoreStateDialogCallbackExpectation = expectation(description: "showRestoreStateDialogCallbackExpectation")
        let endCurrentStateCallbackExpectation = expectation(description: "endCurrentStateCallbackExpectation")
        
        stateToTest.blackjackViewModel = mockModel

        
        mockModel.showRestoreStateDialogCallback = {
            showRestoreStateDialogCallbackExpectation.fulfill()
        }
        
        mockModel.endCurrentStateCallback = {
            endCurrentStateCallbackExpectation.fulfill()
        }
        
        stateToTest.onEnterState()
        
        waitForExpectations(timeout: 5, handler: nil)
    }
}
