//
//  DealerPlayGamestate.swift
//  Blackjack
//
//  Created by martin ogg on 17/03/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import Foundation

class DealerPlayGamestate: GamestateProtocol {
    var nextGamestate: GamestateProtocol?
    var blackjackViewModel: GamestateToBlackjackViewModelProtocol?
    
    weak var dealerViewModel: DealerViewModel?
    
    func onEnterState() {
        let playername = dealerViewModel?.playerName ?? "Player"
        blackjackViewModel?.updateStatusText(text: "\(playername) to play")
        
        dealerViewModel?.unHideFirstCard()
        
        if let dealerViewModel = dealerViewModel {
            while (dealerViewModel.score < 14) {
                if let blackjackViewModel = blackjackViewModel {
                    dealerViewModel.give(card: blackjackViewModel.deck.takeRandomCard())
                }
            }
        }
        
        blackjackViewModel?.updateStatusText(text: "\(playername) finished playing")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.blackjackViewModel?.endCurrentState()
        }
    }
    
    func willLeaveState() { }
    
    func hitButtonPress() { }
    
    func standButtonPress() { }
    
}
