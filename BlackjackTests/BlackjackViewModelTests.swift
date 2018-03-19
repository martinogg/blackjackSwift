//
//  BlackjackViewModelTests.swift
//  BlackjackTests
//
//  Created by martin ogg on 18/03/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import XCTest

class BlackjackViewModelTests: XCTestCase {
    let vmToTest = BlackjackViewModel()
    let mockGameState = MockGameState()
    let mockGameState2 = MockGameState()
    var gameStates: [GamestateProtocol] = []
    
    override func setUp() {
        super.setUp()
        gameStates = [mockGameState, mockGameState]
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    class MockRouter: BlackjackRouterProtocol {
        var gamestateArrayToReturn: [GamestateProtocol] = []
        
        func createGameStates(with viewModel: BlackjackViewModelProtocol) -> [GamestateProtocol] {
            for gamestate in gamestateArrayToReturn {
                gamestate.blackjackViewModel = viewModel as? GamestateToBlackjackViewModelProtocol
            }
            return gamestateArrayToReturn
        }
    }
    
    class MockGameState: GamestateProtocol {
        var blackjackViewModel: GamestateToBlackjackViewModelProtocol?
        
        var onEnterStateCallBack: (()->())?
        var willLeaveStateCallBack: (()->())?
        var hitButtonPressCallBack: (()->())?
        var standButtonPressCallBack: (()->())?
        
        func onEnterState() {
            onEnterStateCallBack?()
        }
        
        func willLeaveState() {
            willLeaveStateCallBack?()
        }
        
        func hitButtonPress() {
            hitButtonPressCallBack?()
        }
        
        func standButtonPress() {
            standButtonPressCallBack?()
        }
        
        var nextGamestate: GamestateProtocol?
    }
    
    func testViewDidLoad() {
        
        let expectOnEnterStateCalled = expectation(description: "expectOnEnterStateCalled")
        mockGameState.onEnterStateCallBack = {
            expectOnEnterStateCalled.fulfill()
        }
        
        let mockRouter = MockRouter()
        mockRouter.gamestateArrayToReturn = gameStates
        vmToTest.router = mockRouter
        
        vmToTest.viewDidLoad()
        
        XCTAssert(vmToTest.gameStates.count == gameStates.count)
        XCTAssert(vmToTest.currentGameState === mockGameState)
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testHitButtonPress() {
        let expectHitButtonPressCalled = expectation(description: "expectHitButtonPressCalled")
        mockGameState.hitButtonPressCallBack = {
            expectHitButtonPressCalled.fulfill()
        }
        
        vmToTest.currentGameState = mockGameState
        
        vmToTest.hitButtonPress()
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testStandButtonPress() {
        let expectStandButtonPressCalled = expectation(description: "expectStandButtonPressCalled")
        mockGameState.standButtonPressCallBack = {
            expectStandButtonPressCalled.fulfill()
        }
        
        vmToTest.currentGameState = mockGameState
        
        vmToTest.standButtonPress()
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testIncrementCurrentGameNum() {
        let mockVC = MockVC()
        let setCurrentGameCallbackExpectation1 = expectation(description: "setCurrentGameCallbackExpectation1")
        let setCurrentGameCallbackExpectation2 = expectation(description: "setCurrentGameCallbackExpectation1")
        
        mockVC.setCurrentGameCallback = { text in
            setCurrentGameCallbackExpectation1.fulfill()
            XCTAssert(text == "Game Number: 1")
        }
        vmToTest.viewController = mockVC
        
        vmToTest.incrementCurrentGameNum()
        
        mockVC.setCurrentGameCallback = { text in
            setCurrentGameCallbackExpectation2.fulfill()
            XCTAssert(text == "Game Number: 2")
        }
        
        vmToTest.incrementCurrentGameNum()
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testUpdateStatusText() {
        let stringToSend = "test text"
        let mockVC = MockVC()
        vmToTest.viewController = mockVC
        
        let setGameStatusCallbackExpectation = expectation(description: "setGameStatusCallbackExpectation")
        
        mockVC.setGameStatusCallback = { text in
            XCTAssert(text == stringToSend)
            setGameStatusCallbackExpectation.fulfill()
        }
        
        vmToTest.updateStatusText(text: stringToSend)
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testEndCurrentState() {
        let willLeaveFirstStateCallBackExpectation = expectation(description: "willLeaveFirstStateCallBackExpectation")
        let onEnterSecondStateCallBackExpectation = expectation(description: "onEnterSecondStateCallBackExpectation")
        
        mockGameState.nextGamestate = mockGameState2
        
        mockGameState.willLeaveStateCallBack = {
            willLeaveFirstStateCallBackExpectation.fulfill()
        }
        mockGameState2.onEnterStateCallBack = {
            onEnterSecondStateCallBackExpectation.fulfill()
        }
        
        vmToTest.currentGameState = mockGameState
        
        vmToTest.endCurrentState()
        XCTAssert(vmToTest.currentGameState === mockGameState2)
        
        waitForExpectations(timeout: 5, handler: nil)
    }

    func testShowRestoreStateDialog() {
        let mockVC = MockVC()
        vmToTest.viewController = mockVC
        let mockSavedState = MockSavedState()
        vmToTest.savedState = mockSavedState
        
        mockSavedState.hasPreviousSavedState = false
        mockVC.showDialogCallback = { (text, response) in
            // showDialog should not be called if there is no previous saved state
            XCTFail()
        }
        
        let showRestoreStateDialogExpectation = expectation(description: "showRestoreStateDialogExpectation")

        vmToTest.showRestoreStateDialog {
            showRestoreStateDialogExpectation.fulfill()
        }
        
        /*
        mockSavedState.hasPreviousSavedState = true
        let showDialogCallback
        mockVC.showDialogCallback = { (text, response) in
            
            
        }
         */
        
        
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    /*
     // TODO TEST
     func showRestoreStateDialog(onComplete: @escaping (() -> ())) {
     
     if savedState?.hasPreviousSavedState == true {
     viewController?.showDialog("Load Previous State?", response: { [weak self] selectedOK in
     if selectedOK == true {
     self?.savedState?.getPreviousState { [weak self] (gameCount, userWins, dealerWins) in
     self?.currentGameNum = gameCount
     self?.userViewModel?.wins = userWins
     self?.dealerViewModel?.wins = dealerWins
     onComplete()
     }
     } else {
     onComplete()
     }
     })
     } else {
     onComplete()
     }
     }
 */
    func testSaveState() {
        let saveStateVMtoTest = BlackjackViewModel()
        
        let mockVC = MockVC()
        
        let mockUserViewModel = UserViewModel()
        let mockDealerUserViewModel = DealerViewModel()
        
        saveStateVMtoTest.viewController = mockVC
        saveStateVMtoTest.userViewModel = mockUserViewModel
        saveStateVMtoTest.dealerViewModel = mockDealerUserViewModel
        
        mockUserViewModel.wins = 1
        mockDealerUserViewModel.wins = 2
        
        saveStateVMtoTest.incrementCurrentGameNum() //1
        saveStateVMtoTest.incrementCurrentGameNum() //2
        saveStateVMtoTest.incrementCurrentGameNum() //3
        
        let mockSavedState = MockSavedState()
        saveStateVMtoTest.savedState = mockSavedState
        
        let setStateCallbackExpectation = expectation(description: "setStateCallbackExpectation")
        
        mockSavedState.setStateCallback = { (gameCount: Int, userWins: Int, dealerWins: Int) in
            setStateCallbackExpectation.fulfill()
            XCTAssert(gameCount == 3)
            XCTAssert(userWins == 1)
            XCTAssert(dealerWins == 2)
        }
        
        saveStateVMtoTest.saveState()
        
        waitForExpectations(timeout: 5, handler: nil)
    }
}
