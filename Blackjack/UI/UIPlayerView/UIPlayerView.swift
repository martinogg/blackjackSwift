//
//  UIPlayerView.swift
//  Blackjack
//
//  Created by martin ogg on 15/03/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class UIPlayerView: UIView, UIPlayerViewProtocol {
    
    var status: UILabel?
    var cardsView: UIView?
    var playerModel: PlayerModelProtocol?
    
    var cards: [UIView] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    private func setupButtons() {
        // TODO TEST
        status = UILabel.init()
        guard let status = status else { return }

        self.addSubview(status)
        
        status.text = "Dealer Hand: 12, Wins: 2"
        status.translatesAutoresizingMaskIntoConstraints = false
        
        let left = NSLayoutConstraint(item: status, attribute: .left, relatedBy: .equal, toItem: self, attribute: .leftMargin, multiplier: 1, constant: 0)
        
        let top = NSLayoutConstraint(item: status, attribute: .top, relatedBy: .equal, toItem: self, attribute: .topMargin, multiplier: 1, constant: 0)
        
        let right = NSLayoutConstraint(item: status, attribute: .right, relatedBy: .equal, toItem: self, attribute: .rightMargin, multiplier: 1, constant: 0)
        
        addConstraints([left, top, right])
        
        
        
        cardsView = UIView.init()
        
        guard let cardsView = cardsView else { return }
        
        cardsView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(cardsView)
        
        cardsView.backgroundColor = UIColor.gray
        
        let cardsLeft = NSLayoutConstraint(item: cardsView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .leftMargin, multiplier: 1, constant: 0)
        
        let cardsTop = NSLayoutConstraint(item: cardsView, attribute: .top, relatedBy: .equal, toItem: status, attribute: .bottom, multiplier: 1, constant: 0)
        
        let cardsRight = NSLayoutConstraint(item: cardsView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .rightMargin, multiplier: 1, constant: 0)
        
        let cardsBottom = NSLayoutConstraint(item: cardsView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottomMargin, multiplier: 1, constant: 0)
        
        addConstraints([cardsLeft, cardsTop, cardsRight, cardsBottom])
    }
    
    func add(card: Card) {
        let newUICard = UIImageView.init(image: UIImage.init(named: card.stringValue))
        cards.append(newUICard)
        cardsView?.addSubview(newUICard)
        // TODO Position correctly
    }
    
    func removeAllCards() {
        _ = cards.map { (card) in
            card.removeFromSuperview()
            // TODO: Animate out, or something
        }
        cards.removeAll()
    }
}
