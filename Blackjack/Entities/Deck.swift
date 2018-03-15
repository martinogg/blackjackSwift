//
//  Deck.swift
//  Blackjack
//
//  Created by martin ogg on 16/03/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import Foundation

class Deck: DeckProtocol {
    private var cards: Set<Card> = []
    
    init() {
        resetDeck()
    }
    
    func resetDeck() {
        //TODO
    }
    
    func takeRandomCard() -> Card? {
        //TODO
        return nil
    }
    
    func take(card: Card) -> Card? {
        //TODO
        return nil
    }
    
    
}
