//
//  CardCollectionViewCell.swift
//  Chemmory
//
//  Created by Grzesiek Kulesza on 01/03/2019.
//  Copyright © 2019 Grzesiek Kulesza. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var frontImageView: UIImageView!
    
    @IBOutlet weak var backImageView: UIImageView!
    
    var card:Card?
    
    func setCard(_ card:Card) {
        // Keep track of the card that gets passed in
        self.card = card
        
        frontImageView.image = UIImage(named: card.imageName)
    }
    
    func flip() {
        
        UIView.transition(from: backImageView, to: frontImageView, duration: 0.3, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
        
    }
    
    
    func flipBack() {
        
    }
}
