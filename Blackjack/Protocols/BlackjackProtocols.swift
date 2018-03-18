//
//  BlackjackProtocols.swift
//  Blackjack
//
//  Created by martin ogg on 15/03/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import Foundation

protocol BlackjackViewControllerProtocol: class {
    // ViewModel -> ViewController
    
    var viewModel: BlackjackViewModelProtocol? {get set}
    
    weak var dealerView: UIPlayerView! {get}
    weak var userView: UIPlayerView! {get}
    
    func setGameStatus(text: String)
    func setCurrentGame(text: String)
}

protocol BlackjackViewModelProtocol: class {
    // ViewController -> ViewModel
    
    weak var viewController: BlackjackViewControllerProtocol? {get set}
    
    var router: BlackjackRouterProtocol? {get set}
    
    weak var userViewModel: UserViewModel? {get set}
    weak var dealerViewModel: DealerViewModel? {get set}
    
    func viewDidLoad()
    
    func hitButtonPress()
    func standButtonPress()

}

protocol BlackjackRouterProtocol: class {
    // ViewModel -> Router
    
    func createGameStates(with viewModel: BlackjackViewModelProtocol) -> [GamestateProtocol]
}
