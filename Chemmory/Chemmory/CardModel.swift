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
        
        //Declare an array to store numbers we've already generated
        var generatedNumbersArray = [Int]()
        
        // Declare an array to store a generated cards
        var generatedCardsArray = [Card]()
        
        // Randomly generate pairs of cards
        //Make it so we only have inique pair of cards
        while generatedNumbersArray.count < 9 {
            
            //Get a random number
            let randomNumber = arc4random_uniform(13) + 1
            
            // Ensure that the number isn't one we already have
            if generatedNumbersArray.contains(Int(randomNumber)) == false {
               
                //Log the number
                print(randomNumber)
                
                //Store the number into generatedNumberArray
                generatedNumbersArray.append(Int(randomNumber))
                
                //Create the first card object
                let cardOne = Card()
                cardOne.imageName = "card\(randomNumber)"
                
                for element in elements {
                    if element.atomicNumber == randomNumber {
                        cardOne.elementMass = element.atomicMass
                        cardOne.elementName = element.name
                        cardOne.elementNumber = element.atomicNumber
                        cardOne.elementSybmol = element.symbol
                        cardOne.elementValence = element.valence
                        // TODO: Make "bold part of string" if element rare and common
                        break
                    }
                }
                
                
                generatedCardsArray.append(cardOne)
                
                // Create the second card object
                let cardTwo = Card()
                cardTwo.imageName = "card\(randomNumber)"
                
                for element in elements {
                    if element.atomicNumber == randomNumber {
                        cardTwo.elementMass = element.atomicMass
                        cardTwo.elementName = element.name
                        cardTwo.elementNumber = element.atomicNumber
                        cardTwo.elementSybmol = element.symbol
                        cardTwo.elementValence = element.valence
                        // TODO: Make "bold part of string" if element rare and common
                        break
                    }
                }
                
                
                generatedCardsArray.append(cardTwo)
                
            }
        }
        // Randomize the array
        //return generatedCardsArray.shuffled()   //TTTT -> uncomment this in final version and remove next line
        return generatedCardsArray
    }
    
    
}
