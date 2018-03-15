//
//  PlayerProtocols.swift
//  Blackjack
//
//  Created by martin ogg on 16/03/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import Foundation

protocol PlayerModelProtocol: class {
    func give(card: Card)
    func resetHand()
}
