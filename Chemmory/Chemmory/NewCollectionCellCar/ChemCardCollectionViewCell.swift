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
    @IBOutlet weak var frontCardView: UIView!
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
            frontCardView.alpha = 0
            
            return
        }
        else {
            // If the card hasn't been matched, then make te image views visable
            backImageView.alpha = 1
            frontImageView.alpha = 0
            frontCardView.alpha = 1
        }
        
        self.frontCardView.layer.cornerRadius = 22.0
        self.frontCardView.layer.borderColor = UIColor.black.cgColor
        self.frontCardView.layer.borderWidth = 2

        frontImageView.image = UIImage(named: card.imageName)
        elementNumberLabel.text = String(card.elementNumber)
        elementValenceLabel.text = card.elementValence
        elementSymbolLabel.text = card.elementSybmol
        elementNameLabel.text = card.elementName
        elementMassLabel.text = String(format: "%.3f",card.elementMass)
        frontCardView.backgroundColor = returnElementGrupColor(grup: card.elementGrup)
        
       
//        elementNameLabel.sizeToFit()
//        elementNumberLabel.sizeToFit()
//        elementValenceLabel.sizeToFit()
//        elementSymbolLabel.sizeToFit()
//        elementNameLabel.sizeToFit()
//        elementMassLabel.sizeToFit()
//        elementNumberLabel.adjustsFontSizeToFitWidth = true
//        elementValenceLabel.adjustsFontSizeToFitWidth = true
//        elementSymbolLabel.adjustsFontSizeToFitWidth = true
//        elementNameLabel.adjustsFontSizeToFitWidth = true
//        elementMassLabel.adjustsFontSizeToFitWidth = true

        
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
            self.frontCardView.alpha = 0
            
        }, completion: nil)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.elementNumberLabel.isHidden = true
            self.elementValenceLabel.isHidden = true
            self.elementSymbolLabel.isHidden = true
            self.elementNameLabel.isHidden = true
            self.elementMassLabel.isHidden = true
        }
        
    }
    
    
    func returnElementGrupColor(grup: Int) -> UIColor {
        var cardViewColor = UIColor.black
        
        switch grup {
        case 0:
            cardViewColor = UIColor.chHydrogen
        case 1:
            cardViewColor = UIColor.chAlkaliMetals
        case 2:
            cardViewColor = UIColor.chAlkalineEarthMetals
        case 3:
            cardViewColor = UIColor.chTransitionMetals
        case 4:
            cardViewColor = UIColor.chLanthanides
        case 5:
            cardViewColor = UIColor.chActinides
        case 6:
            cardViewColor = UIColor.chPoorMetals
        case 7:
            cardViewColor = UIColor.chMetaloids
        case 8:
            cardViewColor = UIColor.chOtherNonMetals
        case 9:
            cardViewColor = UIColor.chHalogens
        case 10:
            cardViewColor = UIColor.chNobelGasses
        default:
            cardViewColor = UIColor.chNoName
        }
        
        return cardViewColor
    }
    
    
}
