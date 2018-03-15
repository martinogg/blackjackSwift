//
//  BlackjackProtocols.swift
//  Blackjack
//
//  Created by martin ogg on 15/03/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import Foundation

protocol BlackjackViewControllerProtocol: class {
    var viewModel: BlackjackViewModelProtocol? {get set}
    // ViewModel -> ViewController
    
}

protocol BlackjackViewModelProtocol: class {
    weak var viewController: BlackjackViewControllerProtocol? {get set}
    // ViewController -> ViewModel
    
}
