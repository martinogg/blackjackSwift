//
//  DealerViewModelTests.swift
//  BlackjackTests
//
//  Created by martin ogg on 18/03/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import XCTest

class DealerViewModelTests: XCTestCase {
    let dealerViewModelToTest = DealerViewModel()
    let mockView = MockUIPlayerView()
    
    class MockUIPlayerView: UIPlayerViewProtocol {
        var playerModel: PlayerModelProtocol?
        
        var statusText: String = ""
        
        func add(card: Card) {
            
        }
        
        var removeAllCardsCallback: (()->())?
        func removeAllCards() {
            removeAllCardsCallback?()
        }
        
        var addHiddenCardCallback: (()->())?
        func addHiddenCard() {
            addHiddenCardCallback?()
        }
        
        var replaceFirstCardCallback: (()->())?
        func replaceFirstCard(with card: Card) {
            replaceFirstCardCallback?()
        }
        
        
    }
    
    override func setUp() {
        super.setUp()
        dealerViewModelToTest.view = mockView
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testResetHand() {
        let removeAllCardsCallbackExpectation = expectation(description: "removeAllCardsCallbackExpectation")
        mockView.removeAllCardsCallback = {
            removeAllCardsCallbackExpectation.fulfill()
        }
        
        dealerViewModelToTest.resetHand()
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testUpdateText() {
        dealerViewModelToTest.resetHand()
        dealerViewModelToTest.playerName = "aName"
        dealerViewModelToTest.updateText()
        
        XCTAssert(mockView.statusText == "aName:")
        
        dealerViewModelToTest.unHideFirstCard()
        
        XCTAssert(mockView.statusText == "aName: Score:0 Wins:0")
    }
    
    func testGiveCardAndUnhideFirstCard() {
        dealerViewModelToTest.resetHand()
        dealerViewModelToTest.playerName = "aName"
        let card = Card.Jack(.Spade)
        
        let addHiddenCardCallbackExpectation = expectation(description: "addHiddenCardCallbackExpectation")
        mockView.addHiddenCardCallback = {
            addHiddenCardCallbackExpectation.fulfill()
        }
        
        dealerViewModelToTest.give(card: card)
        
        //view?.statusText = "\(playerName):"
        
        XCTAssert(mockView.statusText == "aName:")
        
        let replaceFirstCardCallbackExpectation = expectation(description: "replaceFirstCardCallbackExpectation")
        
        mockView.replaceFirstCardCallback = {
            replaceFirstCardCallbackExpectation.fulfill()
        }
        
        
        dealerViewModelToTest.unHideFirstCard()
        
        dealerViewModelToTest.updateText()
        
        XCTAssert(mockView.statusText == "aName: Score:10 Wins:0")
        
        waitForExpectations(timeout: 5, handler: nil)
        
    }
}
