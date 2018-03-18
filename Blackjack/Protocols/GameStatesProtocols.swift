//
//  GameStatesProtocols.swift
//  Blackjack
//
//  Created by martin ogg on 17/03/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import Foundation

protocol GamestateProtocol: class {
    // BlackjackViewModel -> GameState
    
    var blackjackViewModel: GamestateToBlackjackViewModelProtocol? {get set}
    
    func onEnterState()
    func willLeaveState()
    func hitButtonPress()
    func standButtonPress()
    
    weak var nextGamestate: GamestateProtocol? {get set}
}

protocol GamestateToBlackjackViewModelProtocol: class {
    // GameState -> BlackjackViewModel
    
    func updateStatusText(text: String)
    func incrementCurrentGameNum()
    func endCurrentState()
    
}
