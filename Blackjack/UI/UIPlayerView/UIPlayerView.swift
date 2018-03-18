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
        // TODO TEST(CONSTRAINTS/UI)
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
        let image = UIImage.init(named: "\(card.stringValue).png")
        let newUICard = UIImageView.init(image: image)
        newUICard.frame.origin.x = self.frame.width // Get it to the far right to begin with
        cards.append(newUICard)
        cardsView?.addSubview(newUICard)
        
        moveCardsToCorrectPositions()
    }
    
    private func moveCardsToCorrectPositions() {
        //TODO TEST (UI)
        let maxWidth = self.frame.width
        let xDist = maxWidth / CGFloat(cards.count + 1)
        for i in 0..<cards.count {
            let cardToMove = cards[i]
            UIView.animate(withDuration: 0.1, delay: Double(i)*0.1, options: UIViewAnimationOptions.curveEaseOut
                , animations: {
                    cardToMove.frame.origin.x = (xDist * CGFloat(i+1)) - (cardToMove.frame.width / CGFloat(2))
            }, completion: nil)
            
        }
        
    }
    
    func removeAllCards() {
        //TODO TEST (UI)
        for i in 0..<cards.count {
            let cardToMove = cards[i]
            UIView.animate(withDuration: 0.1, delay: Double(i)*0.1, options: UIViewAnimationOptions.curveEaseIn
                , animations: {
                    cardToMove.frame.origin.x = -cardToMove.frame.width
            }, completion: { _ in
                cardToMove.removeFromSuperview()
            })
            
        }
        cards.removeAll()
    }
    
    var statusText: String {
        get {
            return status?.text ?? ""
        }
        set {
            status?.text = newValue
        }
    }
}
