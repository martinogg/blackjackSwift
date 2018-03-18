//
//  BlackjackRouter.swift
//  Blackjack
//
//  Created by martin ogg on 15/03/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import Foundation

class BlackjackRouter: BlackjackRouterProtocol {
    static func attachViewModel(to viewController: BlackjackViewControllerProtocol) {
        let viewModel = BlackjackViewModel()
        let userModel = UserViewModel()
        let dealerModel = DealerViewModel()
        let blackjackRouter = BlackjackRouter()
        
        viewModel.viewController = viewController
        viewModel.router = blackjackRouter // TODO TEST
        viewController.viewModel = viewModel
        
        userModel.view = viewController.userView
        viewController.userView.playerModel = userModel
        dealerModel.view = viewController.dealerView
        viewController.dealerView.playerModel = dealerModel
        
        viewModel.userViewModel = userModel
        viewModel.dealerViewModel = dealerModel
    }
    
    func createGameStates(with viewModel: BlackjackViewModelProtocol) -> [GamestateProtocol] {
        // TODO TEST
        let newGameState = NewPlayGamestate()
        let userPlayGameState = UserPlayGamestate()
        let dealerPlayGameState = DealerPlayGamestate()
        let endPlayGameState = EndPlayGamestate()
        
        newGameState.nextGamestate = userPlayGameState
        userPlayGameState.nextGamestate = dealerPlayGameState
        dealerPlayGameState.nextGamestate = endPlayGameState
        endPlayGameState.nextGamestate = newGameState
        
        if let viewModelForGamestates = viewModel as? GamestateToBlackjackViewModelProtocol {
            newGameState.blackjackViewModel = viewModelForGamestates
            userPlayGameState.blackjackViewModel = viewModelForGamestates
            dealerPlayGameState.blackjackViewModel = viewModelForGamestates
            endPlayGameState.blackjackViewModel = viewModelForGamestates
        }
        
        newGameState.userViewModel = viewModel.userViewModel
        newGameState.dealerViewModel = viewModel.dealerViewModel
        
        userPlayGameState.userViewModel = viewModel.userViewModel
        
        dealerPlayGameState.dealerViewModel = viewModel.dealerViewModel
        
        endPlayGameState.userViewModel = viewModel.userViewModel
        endPlayGameState.dealerViewModel = viewModel.dealerViewModel
        
        return [newGameState, userPlayGameState, dealerPlayGameState, endPlayGameState]
    }
    
}
