//
//  DeckProtocol.swift
//  Blackjack
//
//  Created by martin ogg on 16/03/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import Foundation

protocol DeckProtocol: class {
    func resetDeck()
    func takeRandomCard() -> Card?
    func take(card: Card) -> Card?
}
