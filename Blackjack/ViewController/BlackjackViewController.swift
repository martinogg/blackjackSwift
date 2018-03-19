//
//  BlackjackViewController.swift
//  Blackjack
//
//  Created by martin ogg on 15/03/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import Foundation
import UIKit

class BlackjackViewController: UIViewController {
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
    
    override func viewDidLoad() {
        BlackjackRouter.attachViewModel(to: self)
        viewModel?.viewDidLoad()
    }
    
}

extension BlackjackViewController: BlackjackViewControllerProtocol {
    
    func showDialog(_ text: String, response: @escaping ((Bool)->())) {
    // TODO TEST (UI)
        let alert = UIAlertController.init(title: "Blackjack", message: text, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "OK", style: .default, handler: { (action) in
            response(true)
        }))
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: { (action) in
            response(false)
        }))
        
        DispatchQueue.main.async { [weak self] in
            self?.present(alert, animated: true, completion: nil)
        }
    }
    
    func setGameStatus(text: String) {
        gameStatus.text = text
    }
    
    func setCurrentGame(text: String) {
        currentGame.text = text
    }

}
