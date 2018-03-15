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
        
        viewModel.viewController = viewController
        viewController.viewModel = viewModel
    }
    
}
