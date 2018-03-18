//
//  PlayerProtocols.swift
//  Blackjack
//
//  Created by martin ogg on 16/03/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import Foundation

protocol UIPlayerViewProtocol: class {
    var playerModel: PlayerModelProtocol? { get set } // View -> Model
    
    var statusText: String { get set }
    
    func add(card: Card)
    func removeAllCards()
}

protocol PlayerModelProtocol: class {
    weak var view: UIPlayerViewProtocol? { get set } // Model -> View
    
    var hand: [Card] { get }
    var score: Int { get }
    func give(card: Card)
    func resetHand()
}
