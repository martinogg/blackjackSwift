//
//  UIPlayerViewTests.swift
//  BlackjackTests
//
//  Created by martin ogg on 16/03/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import XCTest

class UIPlayerViewTests: XCTestCase {
    
    let playerViewToTest = UIPlayerView()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAddCardAndRemoveAllCards() {
        
        let card = Card.Ace(.Club)
        playerViewToTest.add(card: card)
        
        XCTAssert(playerViewToTest.cards.count == 1)
        guard let cardsView = playerViewToTest.cardsView,
        let cardInView = playerViewToTest.cards.first else {
            XCTFail()
            return
        }
        XCTAssert(cardsView.subviews.contains(cardInView))
        
        playerViewToTest.removeAllCards()
        XCTAssert(playerViewToTest.cards.count == 0)
        //XCTAssert(cardsView.subviews.count == 0) // TODO: This will fail because it takes time as part of the animation. check after 2 seconds, as part of a UI test
    }
    
    func testStatusText() {
        let stringToTest = "some text"
        let labelToTest = UILabel()
        playerViewToTest.status = labelToTest
        playerViewToTest.statusText = stringToTest
        
        XCTAssert(labelToTest.text == stringToTest)
        XCTAssert(playerViewToTest.statusText == stringToTest)
    }
}
