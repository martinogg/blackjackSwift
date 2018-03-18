//
//  BlackjackViewModel.swift
//  Blackjack
//
//  Created by martin ogg on 15/03/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import Foundation

class BlackjackViewModel {

    var viewController: BlackjackViewControllerProtocol?
    var router: BlackjackRouterProtocol?
    
    weak var userViewModel: UserViewModel?
    weak var dealerViewModel: DealerViewModel?
    var gameStates: [GamestateProtocol] = [];
    weak var currentGameState: GamestateProtocol?
    
    private var currentGameNum = 0
    
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

extension BlackjackViewModel: BlackjackViewModelProtocol {
    
    func viewDidLoad() {
        
        //aTestFunc()
        
        if let newGameStates = router?.createGameStates(with: self),
            let firstGameState = newGameStates.first {
            gameStates = newGameStates
            currentGameState = firstGameState
            currentGameState?.onEnterState()
        }
        
    }
    
    func hitButtonPress() {
        currentGameState?.hitButtonPress()
    }
    
    func standButtonPress() {
        currentGameState?.standButtonPress()
    }
}

extension BlackjackViewModel: GamestateToBlackjackViewModelProtocol {
    func incrementCurrentGameNum() {
        //TODO TEST
        currentGameNum += 1
        viewController?.setCurrentGame(text: "Game Number: \(currentGameNum)")
    }
    
    func updateStatusText(text: String) {
        //TODO TEST
        viewController?.setGameStatus(text: text)
        
    }
    
    func endCurrentState() {
        //TODO TEST
        currentGameState?.willLeaveState()
        currentGameState = currentGameState?.nextGamestate
        currentGameState?.onEnterState()
    }
}

