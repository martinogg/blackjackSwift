//
//  PlayerTests.swift
//  BlackjackTests
//
//  Created by martin ogg on 16/03/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import XCTest

class PlayerTests: XCTestCase {
    
    class MockPlayerView : UIPlayerViewProtocol {
        var statusText: String = ""
        
        var playerModel: PlayerModelProtocol?
        var addFuncCallback: ((Card)->())? = nil
        var removeAllCardsCallback: (()->())? = nil
        
        func add(card: Card) {
            addFuncCallback?(card)
        }
        
        func removeAllCards() {
            removeAllCardsCallback?()
        }
    }
    
    let playerToTest = PlayerModel()
    
    override func setUp() {
        super.setUp()
        playerToTest.resetHand()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testResetHandAndGiveFuncs() {
        let giveFuncExpectation = expectation(description: "giveFuncExpectation")
        let resetFuncExpectation = expectation(description: "resetFuncExpectation")
        
        let cardToSend = Card.Jack(.Club)
        
        let mockPlayerView = MockPlayerView()
        
        mockPlayerView.addFuncCallback = { card in
            giveFuncExpectation.fulfill()
            XCTAssert(card == cardToSend)
        }
        
        mockPlayerView.removeAllCardsCallback = {
            resetFuncExpectation.fulfill()
        }
        
        playerToTest.view = mockPlayerView
        
        playerToTest.give(card: cardToSend)
        playerToTest.resetHand()
        
        XCTAssert(playerToTest.score == 0)
        
        waitForExpectations(timeout: 5)
    }
    
    func testScore2() {
        playerToTest.give(card: Card.Digit(Suite.Club, DigitValue.v2))
        XCTAssert(playerToTest.score == 2)
    }

    func testScore5() {
        playerToTest.give(card: Card.Digit(Suite.Club, DigitValue.v2))
        playerToTest.give(card: Card.Digit(Suite.Club, DigitValue.v3))
        XCTAssert(playerToTest.score == 5)
    }
    
    func testScoreTwoAces() {
        playerToTest.give(card: Card.Ace(Suite.Club))
        playerToTest.give(card: Card.Ace(Suite.Heart))
        XCTAssert(playerToTest.score == 12)
    }

    func testScoreTwoFaces() {
        playerToTest.give(card: Card.Queen(Suite.Club))
        playerToTest.give(card: Card.Jack(Suite.Heart))
        XCTAssert(playerToTest.score == 20)
    }
    
    func testScoreDigitAndFace() {
        playerToTest.give(card: Card.Digit(Suite.Club, DigitValue.v3))
        playerToTest.give(card: Card.King(Suite.Heart))
        XCTAssert(playerToTest.score == 13)
    }
    
    func testScoreDigitFiveAces() {
        playerToTest.give(card: Card.Ace(Suite.Heart))
        playerToTest.give(card: Card.Ace(Suite.Heart))
        playerToTest.give(card: Card.Ace(Suite.Heart))
        playerToTest.give(card: Card.Ace(Suite.Heart))
        playerToTest.give(card: Card.Ace(Suite.Heart))
        XCTAssert(playerToTest.score == 15)
    }
    
    
}
