//
//  ViewController.swift
//  Chemmory
//
//  Created by Grzesiek Kulesza on 27/02/2019.
//  Copyright © 2019 Grzesiek Kulesza. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var model = CardModel()
    var cardArray = [Card]()
    
    var firstFlippedCardIndex: IndexPath?
    
    var timer:Timer?
    var miliseconds:Float = 10 * 1000 // 10 seconds

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Call the getCard method of the card model
        cardArray = model.getCards()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // Create timer
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(timerElapsed), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: .common)
    }

    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Timer Methods
    
    @objc func timerElapsed() {
        
        miliseconds -= 1
        timerLabel.text?.append("A")
        // Convert to seconds
        let seconds = String(format: "%.2f", miliseconds/1000)
        
        // Set label
        timerLabel.text = "Timer Remaining: \(seconds)"
        
        //When the timer reached 0
        if miliseconds <= 0 {
            timer?.invalidate()
        }
    }
    
    // MARK: - UICollectionView Protocol Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return cardArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Get an CardCollectionViewCell object
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCollectionViewCell
        
        // Get the card that the collection view is trying to display
        let card = cardArray[indexPath.row]
        
        //Set that crd for the cell
        cell.setCard(card)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //Get cell that the user selected
        let cell = collectionView.cellForItem(at: indexPath) as! CardCollectionViewCell
        
        //Get the card that the user selected
        let card = cardArray[indexPath.row]
        
        
        if card.isFliped == false && card.isMatched == false {
            
            // Flip the card
            cell.flip()
            
            //Set the status of teh card
            card.isFliped = true
            
            // Determine if it's the first card or second card that's flipped over
            
            if firstFlippedCardIndex == nil {
                // This is the first card beign flipped
                firstFlippedCardIndex = indexPath
            }
            else {
                
                // This is the second card beign flipped
                
                // TODO: Perform the matching logic
                checkForMatches(indexPath)
            }
        }
    
    } // End the didSelectItemAt method
    
    // MARK: - Game Logic Methods
    
    func checkForMatches(_ secondFlippedCardIndex: IndexPath) {
        
        // Get the cells for the two cards that were revealed
        let cardOneCell = collectionView.cellForItem(at: firstFlippedCardIndex!) as? CardCollectionViewCell
        let cardTwoCell = collectionView.cellForItem(at: secondFlippedCardIndex) as? CardCollectionViewCell
        
        
        // Get the cards for the two cards were revealed
        let cardOne = cardArray[firstFlippedCardIndex!.row]
        let cardTwo = cardArray[secondFlippedCardIndex.row]
        
        // Compare the two cards
        if cardOne.imageName == cardTwo.imageName {
            
            //It's a match
            
            // Set the status of the cards
            cardOne.isMatched = true
            cardTwo.isMatched = true
            
            // Remove the cards from the grid
            cardOneCell?.remove()
            cardTwoCell?.remove()
            
        }
        else {
            
            // It;s not a match
            
            // Set the statuses  of the cards
            cardOne.isFliped = false
            cardTwo.isFliped = false
        
            // Flip both cards back
            cardOneCell?.flipBack()
            cardTwoCell?.flipBack()
        }
        
            // Tell the collectionView to relad the cell of the first card if it is nil
        if cardOneCell == nil {
            collectionView.reloadItems(at: [firstFlippedCardIndex!])
        }
        // Reset the property that tracks the first card flipped
        firstFlippedCardIndex = nil
        
    }
    
} // End ViewControoler class

