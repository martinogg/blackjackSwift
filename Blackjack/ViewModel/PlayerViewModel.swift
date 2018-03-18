//
//  PlayerViewModel.swift
//  Blackjack
//
//  Created by martin ogg on 16/03/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import Foundation

class PlayerModel: PlayerModelProtocol {
    var view: UIPlayerViewProtocol?
    var hand = [Card]()
    var playerName = "Unnamed"
    var wins = 0
    
    func give(card: Card) {
        hand.append(card)
        view?.add(card: card)
        updateText()
    }
    
    func resetHand() {
        hand.removeAll()
        view?.removeAllCards()
    }
    
    func updateText() {
        // todo test
        view?.statusText = "\(playerName): Score:\(score) Wins:\(wins)"
    }
    
    var score: Int {
        get {
            var score = hand.reduce(0) { (previous, card) -> Int in
                switch(card) {
                case .Digit(_, let digitValue):
                    return previous + digitValue.rawValue
                case .Jack(_):
                    return previous + 10
                case .Queen(_):
                    return previous + 10
                case .King(_):
                    return previous + 10
                case .Ace(_):
                    return previous + 11 // Default to max value initially
                }
            }
            
            // Reduce Ace's values sequentially until <= 21
            
            _ = hand.filter { (card) -> Bool in
                switch (card) {
                case .Ace(_):
                    return true
                default:
                    return false
                }
                } .map {_ in
                    if score > 21 {
                        score -= 10
                    }
            }
            
            return score
        }
    }
    
    
}
