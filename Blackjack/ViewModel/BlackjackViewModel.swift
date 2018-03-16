//
//  BlackjackViewModel.swift
//  Blackjack
//
//  Created by martin ogg on 15/03/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import Foundation

class BlackjackViewModel: BlackjackViewModelProtocol {
    var viewController: BlackjackViewControllerProtocol?
    
    weak var userViewModel: UserViewModel?
    weak var dealerViewModel: DealerViewModel?
    
    private var currentGame = 0
    
    func viewDidLoad() {
        
        aTestFunc()
        
        //TODO TEST
        //startANewGame()
        
    }
    
    private func startANewGame() {
        currentGame += 1;
        
    }
    
    private func aTestFunc() {
        // TODO DELETE THIS TEST FUNCTION
        if let user = self.userViewModel {
            testCards(player: user)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [weak self] in
            if let dealer = self?.dealerViewModel {
                self?.testCards(player: dealer)
            }
        }
    }
    
    private func testCards(player: PlayerModel) {
        // TODO DELETE THIS TEST FUNCTION
        var deck = Deck()
        deck.resetDeck()
        
        for i in 2...6 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) { [weak player] in
                if let newCard = deck.takeRandomCard() {
                    player?.give(card: newCard)
                }
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 8.0) { [weak player] in
            player?.resetHand()
        }
    }
}

