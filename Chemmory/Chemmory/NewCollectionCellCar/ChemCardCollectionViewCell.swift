//
//  ChemCardCollectionViewCell.swift
//  Chemmory
//
//  Created by Grzesiek Kulesza on 01/04/2019.
//  Copyright © 2019 Grzesiek Kulesza. All rights reserved.
//

import UIKit

class ChemCardCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var frontImageView: UIImageView!
    @IBOutlet weak var backImageView: UIImageView!
    
    @IBOutlet weak var elementNumberLabel: UILabel!
    @IBOutlet weak var elementValenceLabel: UILabel!
    @IBOutlet weak var elementSymbolLabel: UILabel!
    @IBOutlet weak var elementNameLabel: UILabel!
    @IBOutlet weak var elementMassLabel: UILabel!
    
    var card:Card?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setCard(_ card:Card) {
        // Keep track of the card that gets passed in
        self.card = card
        
        if card.isMatched == true {
            // If the card has been matched, then the image views invisible
            backImageView.alpha = 0
            frontImageView.alpha = 0
            
            return
        }
        else {
            // If the card hasn't been matched, then make te image views visable
            backImageView.alpha = 1
            frontImageView.alpha = 1
        }
        frontImageView.image = UIImage(named: card.imageName)
        
        
        // Determine if teh card is in flipped up state or flipped down state
        if card.isFliped == true {
            
            // Make sure the frontimage view is on top
            UIView.transition(from: backImageView, to: frontImageView, duration: 0, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
        }
        else {
            // Make sure the backimageview is on top
            UIView.transition(from: frontImageView, to: backImageView, duration: 0, options: [.showHideTransitionViews,.transitionFlipFromLeft], completion: nil)
        }
        
    }
    
    func flip() {
        
        UIView.transition(from: backImageView, to: frontImageView, duration: 0.3, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
    }
    
    
    func flipBack() {
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
            
            UIView.transition(from: self.frontImageView, to: self.backImageView, duration: 0.3, options: [.transitionFlipFromRight, .showHideTransitionViews], completion: nil)
        }
    }
    
    func remove() {
        
        //Removes both imageviews from beign visable
        backImageView.alpha = 0
        
        UIView.animate(withDuration: 0.3, delay: 0.5, options: .curveEaseOut, animations: {
            self.frontImageView.alpha = 0
        }, completion: nil)
    }
}
