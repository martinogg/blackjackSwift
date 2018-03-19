//
//  SavedStateProtocol.swift
//  Blackjack
//
//  Created by martin ogg on 19/03/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import Foundation

protocol SavedStateProtocol {
    var hasPreviousSavedState: Bool { get }
    func getPreviousState(_ callBack: @escaping ((gameCount: Int, userWins: Int, dealerWins: Int))->())
    func setState(gameCount: Int, userWins: Int, dealerWins: Int)
}
