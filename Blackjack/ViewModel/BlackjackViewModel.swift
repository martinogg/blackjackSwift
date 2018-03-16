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
    
    func viewDidLoad() {
        //TODO TEST
        DispatchQueue.main.async { [weak self] in
            self?.userViewModel?.give(card: Card.Ace(.Club))
            
        }
        
    }
}

