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
        // TODO
    }
    
    func willLeaveState() {
        // TODO
    }
    
    func hitButtonPress() {
        // TODO
    }
    
    func standButtonPress() {
        // TODO
    }

}
