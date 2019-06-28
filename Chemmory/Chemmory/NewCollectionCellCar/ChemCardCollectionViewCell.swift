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
    @IBOutlet var elementFontLabels: [UILabel]!
    
    var card:Card?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        colorFontsOnCard()
    }
    
    enum elementPart {
        case name
        case mass
        case valence
        case number
        case symbol
    }
    
    func showOnly(_ part: elementPart){
        
        // Show only one part of element as a hint for the better learn
        
        switch part {
        case .name:
            elementMassLabel.isHidden = true
            elementNumberLabel.isHidden = true
            elementValenceLabel.isHidden = true
            elementNameLabel.isHidden = false
            
        case .mass:
            elementMassLabel.isHidden = false
            elementNumberLabel.isHidden = true
            elementValenceLabel.isHidden = true
            elementNameLabel.isHidden = true
            
        case .valence:
            elementMassLabel.isHidden = true
            elementNumberLabel.isHidden = true
            elementValenceLabel.isHidden = false
            elementNameLabel.isHidden = true
            
        case .number:
            elementMassLabel.isHidden = true
            elementNumberLabel.isHidden = false
            elementValenceLabel.isHidden = true
            elementNameLabel.isHidden = true
        
        case .symbol:
            elementMassLabel.isHidden = true
            elementNumberLabel.isHidden = true
            elementValenceLabel.isHidden = true
            elementNameLabel.isHidden = true
        }
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
            // If the card hasn't been matched, then make the image views visable
            backImageView.alpha = 1
            frontImageView.alpha = 0
            frontCardView.alpha = 1
        }
        
        self.frontCardView.layer.cornerRadius = 22.0
        self.frontCardView.layer.borderColor = UIColor.black.cgColor
        self.frontCardView.layer.borderWidth = 2
      

        switch globalSettings.hintUserChose {
        case "name":
            if card.isCardOne {
                showOnly(elementPart.name)
            }
        case "mass":
            if card.isCardOne {
                showOnly(elementPart.mass)
            }
 
        case "valence":
            if card.isCardOne {
                showOnly(elementPart.valence)
            }
        case "number":
            if card.isCardOne {
                showOnly(elementPart.number)
            }
      
        default:
            if card.isCardOne {
                showOnly(elementPart.symbol)
            }
        }
        if card.isCardOne == false {
            showOnly(elementPart.symbol)
            
        }
        
        backImageView.image = UIImage(named: card.imageBackName)
        elementNumberLabel.text = String(card.elementNumber)
        elementSymbolLabel.text = card.elementSybmol
        elementNameLabel.text = card.elementName
        elementMassLabel.text = String(format: "%.3f",card.elementMass)
        frontCardView.backgroundColor = returnElementGrupColor(grup: card.elementGrup)
        
        // valence custom label font. If common - bold (B), regular - normal (N), rare - thin (T)
        var ValText: String = card.elementValence
        ValText.append(ValText)
        
        let actualTotalValence = valencesToArray(regular: card.elementValence, common: card.elementValenceC, rare: card.elementValenceR)
        
        let formattedString = NSMutableAttributedString()

        for i in 1..<actualTotalValence.count {
            switch actualTotalValence[i] {
            case "N":
                 formattedString.normal(String(i))
            case "B":
                 formattedString.bold(String(i))
            case "T":
                formattedString.curs(String(i))
            default:
                continue
            }

        }
        
        let lbl = UILabel()
        lbl.attributedText = formattedString
        elementValenceLabel.attributedText = formattedString
        
        
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
            cardViewColor = UIColor(red: CGFloat(globalSettings.cardFrontColorRed), green: CGFloat(globalSettings.cardFrontColorGreen), blue: CGFloat(globalSettings.cardFrontColorBlue), alpha: 1.0)
        }
        
        return cardViewColor
    }
    
    func colorFontsOnCard() {
        for label in elementFontLabels {
            label.textColor = UIColor(red: CGFloat(globalSettings.cardFontsColorRed), green: CGFloat(globalSettings.cardFontsColorGreen), blue: CGFloat(globalSettings.cardFontsColorBlue), alpha: 1.0)
        }
        
    }
    
    func valencesToArray(regular: String, common: String, rare: String) -> [Character] {
        
        var ValenceD: [Character] = ["0","0","0","0","0","0","0","0","0"]
        let regularS = regular.split(separator: ",")
        let commonS = common.split(separator: ",")
        let rareS = rare.split(separator: ",")
        
        for i in 0..<regularS.count {
            if let valueTemp = Int(regularS[i]){
                ValenceD[valueTemp] = "N" //normal
            }
        }
        for i in 0..<commonS.count {
            if let valueTemp = Int(commonS[i]){
                ValenceD[valueTemp] = "B" //bold
            }
        }
        
        for i in 0..<rareS.count {
            if let valueTemp = Int(rareS[i]){
                ValenceD[valueTemp] = "T" //thin
            }
        }
        return ValenceD
    }
    
}

extension NSMutableAttributedString {
    @discardableResult func bold(_ text: String) -> NSMutableAttributedString {
        let attrs: [NSAttributedString.Key: Any] = [.font: UIFont(name: "AvenirNext-Bold", size: 15)!]
        let boldString = NSMutableAttributedString(string:text, attributes: attrs)
        append(boldString)
        
        return self
    }
    
    @discardableResult func curs(_ text: String) -> NSMutableAttributedString {
        let attrs: [NSAttributedString.Key: Any] = [.font: UIFont(name: "AvenirNext-UltraLight", size: 15)!]
        let thinString = NSMutableAttributedString(string:text, attributes: attrs)
        append(thinString)
        
        return self
    }
    
    @discardableResult func normal(_ text: String) -> NSMutableAttributedString {
        let normal = NSAttributedString(string: text)
        append(normal)
        
        return self
    }
}
