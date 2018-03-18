//
//  EndPlayGamestate.swift
//  Blackjack
//
//  Created by martin ogg on 17/03/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import Foundation

enum Winner {
    case User
    case Dealer
    case Draw
}

class EndPlayGamestate: GamestateProtocol {
    var nextGamestate: GamestateProtocol?
    var blackjackViewModel: GamestateToBlackjackViewModelProtocol?
    
    weak var userViewModel: UserViewModel?
    weak var dealerViewModel: DealerViewModel?
    
    func onEnterState() {
        // TODO TEST
        
        let winner = calculateWinner()
        switch winner {
        case .User:
            blackjackViewModel?.updateStatusText(text: "Game End. Congratulations!")
            userViewModel?.wins += 1
        case .Dealer:
            blackjackViewModel?.updateStatusText(text: "Game End. Dealer Wins")
            dealerViewModel?.wins += 1
        case .Draw:
            blackjackViewModel?.updateStatusText(text: "Game End. Draw")
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.blackjackViewModel?.endCurrentState()
        }
    }
    
    func willLeaveState() { }
    
    func hitButtonPress() { }
    
    func standButtonPress() { }
    
    func calculateWinner() -> Winner {
        // TODO TEST
        
        //Scenarios: (according to spec) in priority order
        //if user > 21. lose. Regardless of Dealer score
        //if dealer > 21, Win. (Dealer has bust and User is <= 21)
        //if scores are the same: Draw (not mentioned in spec)
        //if user > dealer, User Win. else Dealer Win
        // NOTE: What in the scenario of User:19, Dealer:22? I think the User should win as Dealer is bust, but spec says "player with value closer to 21 wins" 22 is closer than 19!
        
        guard let userScore = userViewModel?.score,
            let dealerScore = dealerViewModel?.score else {
            return .Draw
        }
        
        if userScore > 21 { return .Dealer }
        if dealerScore > 21 { return .User }
        if userScore == dealerScore { return .Draw }
        if userScore > dealerScore { return .User } else {
            return .Dealer
        }
    }
}
