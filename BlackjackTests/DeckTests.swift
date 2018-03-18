//
//  DeckTests.swift
//  BlackjackTests
//
//  Created by martin ogg on 16/03/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import XCTest

class DeckTests: XCTestCase {
    
    var deckToTest = Deck()
    
    override func setUp() {
        super.setUp()
        deckToTest.resetDeck()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAllCardsInFreshDeck() {
        let allPossibleCards = self.allPossibleCards()
        var cardsFromDeck = Set<Card>()
        
        for cardToTake in allPossibleCards {
            if let cardTaken = deckToTest.remove(cardToTake) {
                cardsFromDeck.insert(cardTaken)
            } else {
                XCTFail("tested Deck did not contain Card \(cardToTake)")
            }
        }
        
        XCTAssert(cardsFromDeck.count == 52)
        XCTAssert(deckToTest.count == 0)
        
        // Now test that all the cards are in the received set
        for card in allPossibleCards {
            XCTAssert(cardsFromDeck.contains(card))
        }
    }
    
    func testRandomCardsInFreshDeck() {
        let allPossibleCards = self.allPossibleCards()
        var cardsFromDeck = Set<Card>()
        
        repeat {
            cardsFromDeck.insert(deckToTest.takeRandomCard())
        } while deckToTest.count > 0
        
        XCTAssert(cardsFromDeck.count == 52)
        XCTAssert(deckToTest.count == 0)
        
        // Now test that all the cards are in the received set
        for card in allPossibleCards {
            XCTAssert(cardsFromDeck.contains(card))
        }
    }
    
    private func allPossibleCards() -> [Card] {
        var cards = [Card]()
        
        let suites: [Suite] = [.Club, .Diamond, .Heart, .Spade]
        let digitValues: [DigitValue] = [.v2, .v3, .v4, .v5, .v6, .v7, .v8, .v9, .v10]
        
        for suite in suites {
            for digit in digitValues {
                cards.append(Card.Digit(suite, digit))
            }
            cards.append(Card.Jack(suite))
            cards.append(Card.Queen(suite))
            cards.append(Card.King(suite))
            cards.append(Card.Ace(suite))
        }
        return cards
    }
    
}
