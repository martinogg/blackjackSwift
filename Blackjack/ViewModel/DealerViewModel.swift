//
//  DealerViewModel.swift
//  Blackjack
//
//  Created by martin ogg on 16/03/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import Foundation

class DealerViewModel: PlayerModel {
    private var hideFirstCard: Bool = true
    
    override func resetHand() {
        // TODO TEST
        super.resetHand()
        hideFirstCard = true
    }
    
    override func updateText() {
        //TODO TEST
        if (!hideFirstCard) {
            super.updateText()
        } else {
            view?.statusText = "\(playerName):"
        }
    }
    
    override func give(card: Card) {
        //TODO TEST
        if hand.count == 0 && hideFirstCard == true {
            hand.append(card)
            view?.addHiddenCard()
            updateText()
        } else {
            super.give(card: card)
        }
    }
    
    func unHideFirstCard() {
        //TODO TEST
        hideFirstCard = false
        if let firstCard = hand.first {
            view?.replaceFirstCard(with: firstCard)
        }
        updateText()
    }
}
