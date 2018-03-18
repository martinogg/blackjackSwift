//
//  BlackjackViewController.swift
//  Blackjack
//
//  Created by martin ogg on 15/03/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import Foundation
import UIKit

class BlackjackViewController: UIViewController, BlackjackViewControllerProtocol {
    var viewModel: BlackjackViewModelProtocol?
    
    @IBOutlet weak var dealerView: UIPlayerView!
    @IBOutlet weak var userView: UIPlayerView!
    
    @IBAction func hitButtonPress(_ sender: Any) {
        viewModel?.hitButtonPress()
    }
    
    @IBAction func standButtonPress(_ sender: Any) {
        viewModel?.standButtonPress()
    }
    
    @IBOutlet weak var gameStatus: UILabel!
    @IBOutlet weak var currentGame: UILabel!
    
    func setGameStatus(text: String) {
        gameStatus.text = text
    }
    
    func setCurrentGame(text: String) {
        currentGame.text = text
    }
    
    override func viewDidLoad() {
        BlackjackRouter.attachViewModel(to: self)
        viewModel?.viewDidLoad()
    }
    
}
