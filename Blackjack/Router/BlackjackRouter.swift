//
//  BlackjackRouter.swift
//  Blackjack
//
//  Created by martin ogg on 15/03/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import Foundation

class BlackjackRouter {
    static func attachViewModel(to viewController: BlackjackViewControllerProtocol) {
        let viewModel = BlackjackViewModel()
        let userModel = UserViewModel()
        let dealerModel = DealerViewModel()
            
        viewModel.viewController = viewController
        viewController.viewModel = viewModel
        
        userModel.view = viewController.userView
        viewController.userView.playerModel = userModel
        dealerModel.view = viewController.dealerView
        viewController.dealerView.playerModel = dealerModel
        
        viewModel.userViewModel = userModel
        viewModel.dealerViewModel = dealerModel
    }
    
}
