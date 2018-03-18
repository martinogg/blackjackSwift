//
//  UserPlayGamestate.swift
//  Blackjack
//
//  Created by martin ogg on 17/03/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import Foundation

class UserPlayGamestate: GamestateProtocol {
    var nextGamestate: GamestateProtocol?
    var blackjackViewModel: GamestateToBlackjackViewModelProtocol?
    
    weak var userViewModel: UserViewModel?
    
    func onEnterState() {
        let playername = userViewModel?.playerName ?? "Player"
        blackjackViewModel?.updateStatusText(text: "\(playername) to play")
    }
    
    func willLeaveState() { }
    
    func hitButtonPress() {
        if let blackjackViewModel = blackjackViewModel {
            userViewModel?.give(card: blackjackViewModel.deck.takeRandomCard())
        }
        if let score = userViewModel?.score {
            if score >= 21 {
                blackjackViewModel?.endCurrentState()
            }
        }
    }
    
    func standButtonPress() {
        blackjackViewModel?.endCurrentState()
    }
    

}
