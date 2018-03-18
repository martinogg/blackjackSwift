//
//  NewPlayGamestate.swift
//  Blackjack
//
//  Created by martin ogg on 17/03/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import Foundation

class NewPlayGamestate: GamestateProtocol {
    var nextGamestate: GamestateProtocol?
    var blackjackViewModel: GamestateToBlackjackViewModelProtocol?
    
    weak var userViewModel: UserViewModel?
    weak var dealerViewModel: DealerViewModel?
    
    func onEnterState() {
        // TODO TEST
        
        guard let blackjackViewModel: GamestateToBlackjackViewModelProtocol = blackjackViewModel else {
            fatalError()
        }
        
        blackjackViewModel.incrementCurrentGameNum()
        blackjackViewModel.updateStatusText(text: "New Game")
        
        blackjackViewModel.deck.resetDeck()
        dealerViewModel?.resetHand()
        userViewModel?.resetHand()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            
            self?.dealerViewModel?.give(card: blackjackViewModel.deck.takeRandomCard()!) //NO! dddd
            self?.dealerViewModel?.give(card: blackjackViewModel.deck.takeRandomCard()!) //NO!
            self?.userViewModel?.give(card: blackjackViewModel.deck.takeRandomCard()!) //NO!
            self?.userViewModel?.give(card: blackjackViewModel.deck.takeRandomCard()!) //NO!
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
                self?.blackjackViewModel?.endCurrentState()
            }
        }
    }
    
    func willLeaveState() { }
    
    func hitButtonPress() { }
    
    func standButtonPress() { }
}
