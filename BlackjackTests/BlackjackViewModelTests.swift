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
    
    class MockVC: BlackjackViewControllerProtocol
    {
        var viewModel: BlackjackViewModelProtocol?
        var dealerView: UIPlayerView!
        var userView: UIPlayerView!
        
        var setGameStatusCallback: ((String)->())?
        func setGameStatus(text: String) {
            setGameStatusCallback?(text)
        }
        
        var setCurrentGameCallback: ((String)->())?
        func setCurrentGame(text: String) {
            setCurrentGameCallback?(text)
        }
        
        
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

}
