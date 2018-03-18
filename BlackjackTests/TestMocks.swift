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
