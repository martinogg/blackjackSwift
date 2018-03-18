//
//  BlackjackViewControllerTests.swift
//  BlackjackTests
//
//  Created by martin ogg on 16/03/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import XCTest
import UIKit

class BlackjackViewControllerTests: XCTestCase {
    
    let vcToTest = BlackjackViewController()
    let mockViewModel = MockViewModel()
    
    override func setUp() {
        super.setUp()
        vcToTest.viewModel = mockViewModel
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testViewDidLoad() {
        
        let dealerView = UIPlayerView()
        vcToTest.dealerView = dealerView
        let userView = UIPlayerView()
        vcToTest.userView = userView

        vcToTest.viewDidLoad()
        
        //This test dont belong here, but the existence of the viewModel in here shows the router was called
        XCTAssert(vcToTest.viewModel != nil)
        
        //TODO TEST NOTE: view model's viewDidLoad is not tested yet. because the viewModel can't be mocked
    }
    
    class MockViewModel: BlackjackViewModelProtocol {
        var router: BlackjackRouterProtocol?
        
        var viewController: BlackjackViewControllerProtocol?
        
        var userViewModel: UserViewModel?
        
        var dealerViewModel: DealerViewModel?
        
        func viewDidLoad() { }
        
        var hitButtonPressCallback: (()->())?
        var standButtonPressCallback: (()->())?
        
        func hitButtonPress() {
            hitButtonPressCallback?()
        }
        
        func standButtonPress() {
            standButtonPressCallback?()
        }
    }
    
    func testHitButtonPress() {
        let testHitButtonPressExpectation = expectation(description: "testHitButtonPressExpectation")
        mockViewModel.hitButtonPressCallback = {
            testHitButtonPressExpectation.fulfill()
        }
        
        vcToTest.hitButtonPress(UIView())
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testStandButtonPress() {
        let testStandButtonPressExpectation = expectation(description: "testStandButtonPressExpectation")
        mockViewModel.standButtonPressCallback = {
            testStandButtonPressExpectation.fulfill()
        }
        
        vcToTest.standButtonPress(UIView())
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testSetGameStatus() {
        let gameStatusLabel = UILabel()
        let testString = "testString"
        
        vcToTest.gameStatus = gameStatusLabel
        
        vcToTest.setGameStatus(text: testString)
        
        guard let vcStringToTest = gameStatusLabel.text else {
            XCTFail()
            return
        }
        
        XCTAssert(vcStringToTest == testString)
    }
    
    func testSetCurrentGame() {
        let currentGameLabel = UILabel()
        let testString = "testString"
        
        vcToTest.currentGame = currentGameLabel
        
        vcToTest.setCurrentGame(text: testString)
        
        guard let vcStringToTest = currentGameLabel.text else {
            XCTFail()
            return
        }
        
        XCTAssert(vcStringToTest == testString)
    }
}
