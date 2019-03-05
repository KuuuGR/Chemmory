//
//  CardModel.swift
//  Chemmory
//
//  Created by Grzesiek Kulesza on 01/03/2019.
//  Copyright © 2019 Grzesiek Kulesza. All rights reserved.
//

import Foundation

class CardModel {
    
    
    func getCards() -> [Card] {
        
        // Declare an array to store a generated cards
        var generatedCardsArray = [Card]()
        
        // Randomly generate pairs of cards
        for _ in 1...8 {
            
            //Get a random number
            let randomNumber = arc4random_uniform(0) + 1
            
            //Log the number
            print(randomNumber)
            
            //Create the first card object
            let cardOne = Card()
            cardOne.imageName = "card\(randomNumber)"
            
            generatedCardsArray.append(cardOne)
            
            // Create the second card object
            let cardTwo = Card()
            cardTwo.imageName = "card\(randomNumber)"
            
            generatedCardsArray.append(cardTwo)
            
            // OPTIONAL: Make it so we only have inique pair of cards
        }
        
        //TODO: Randomize the array
        
        // Return the array
        return generatedCardsArray
        
    }
    
    
}
