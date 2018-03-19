//
//  AppStartGamestate.swift
//  Blackjack
//
//  Created by martin ogg on 19/03/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import Foundation

class AppStartGamestate: GamestateProtocol {
    var blackjackViewModel: GamestateToBlackjackViewModelProtocol?
    
    func onEnterState() {
        blackjackViewModel?.showRestoreStateDialog(onComplete: { [weak self] in
            self?.blackjackViewModel?.endCurrentState()
        })
    }
    
    func willLeaveState() { }
    
    func hitButtonPress() { }
    
    func standButtonPress() { }
    
    var nextGamestate: GamestateProtocol?
    
    
}
