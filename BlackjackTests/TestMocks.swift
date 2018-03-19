//
//  TestMocks.swift
//  BlackjackTests
//
//  Created by martin ogg on 18/03/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import Foundation

class MockDealerViewModel: DealerViewModel {
    var giveCallBack: (()->())?
    
    var cardToGiveInstead = Card.Jack(.Club) // will always give the same card.
    override func give(card: Card) {
        
        super.give(card: cardToGiveInstead)
        giveCallBack?()
    }
    
    var unHideFirstCardCallback: (()->())?
    override func unHideFirstCard() {
        unHideFirstCardCallback?()
        super.unHideFirstCard()
    }
}

class MockUserViewModel: UserViewModel {
    var giveCallBack: (()->())?
    
    var cardToGiveInstead = Card.Jack(.Club) // will always give the same card.
    override func give(card: Card) {
        
        super.give(card: cardToGiveInstead)
        giveCallBack?()
    }
}

class MockViewModel: GamestateToBlackjackViewModelProtocol {
    
    var saveStateCallback: (()->())?
    func saveState() { }

    var showRestoreStateDialogCallback: (()->())?
    func showRestoreStateDialog(onComplete: @escaping (() -> ())) {
        showRestoreStateDialogCallback?()
        onComplete()
    }
    
    var deck: Deck = Deck()
    
    var updateStatusTextCallback: ((String)->())?
    func updateStatusText(text: String) {
        updateStatusTextCallback?(text)
    }
    
    var incrementCurrentGameNumCallback: (()->())?
    func incrementCurrentGameNum() {
        incrementCurrentGameNumCallback?()
    }
    
    var endCurrentStateCallback: (()->())?
    func endCurrentState() {
        endCurrentStateCallback?()
    }
    
}

class MockVC: BlackjackViewControllerProtocol
{
    var showDialogCallback: ((String, ((Bool)->()) )->())?
    func showDialog(_ text: String, response: @escaping ((Bool) -> ())) {
        showDialogCallback?(text, response)
    }
    
    var viewModel: BlackjackViewModelProtocol?
    var dealerView: UIPlayerView!
    var userView: UIPlayerView!
    
    var setGameStatusCallback: ((String)->())?
    func setGameStatus(text: String) {
        setGameStatusCallback?(text)
    }
    
    var setCurrentGameCallback: ((String)->())?
    func setCurrentGame(text: String) {
        setCurrentGameCallback?(text)
    }
}

class MockSavedState: SavedStateProtocol {
    var hasPreviousSavedState: Bool = false
    
    var gameCountToReturn = 3
    let userWinsToReturn = 2
    let dealerWinsToReturn = 1
    
    var getPreviousStateCallback: (()->())?
    func getPreviousState(_ callBack: @escaping ((gameCount: Int, userWins: Int, dealerWins: Int)) -> ()) {
        getPreviousStateCallback?()
        callBack((gameCount: gameCountToReturn, userWins: userWinsToReturn, dealerWins: dealerWinsToReturn))
        
    }
    
    var setStateCallback: ((_ gameCount: Int, _ userWins: Int, _ dealerWins: Int) -> ())?
    func setState(gameCount: Int, userWins: Int, dealerWins: Int) {
        setStateCallback?(gameCount, userWins, dealerWins)
    }
    
    
}

