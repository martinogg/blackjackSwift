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
        // TODO TEST
        let playername = userViewModel?.playerName ?? "Player"
        blackjackViewModel?.updateStatusText(text: "\(playername) to play")
    }
    
    func willLeaveState() { }
    
    func hitButtonPress() {
        // TODO TEST
        if let blackjackViewModel = blackjackViewModel {
            userViewModel?.give(card: blackjackViewModel.deck.takeRandomCard()!) // dddd NO!
        }
        if let score = userViewModel?.score {
            if score >= 21 {
                blackjackViewModel?.endCurrentState()
            }
        }
    }
    
    func standButtonPress() {
        // TODO TEST
        blackjackViewModel?.endCurrentState()
    }
    

}
