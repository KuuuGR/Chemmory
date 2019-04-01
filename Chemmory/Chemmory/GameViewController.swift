//
//  ViewController.swift
//  Chemmory
//
//  Created by Grzesiek Kulesza on 27/02/2019.
//  Copyright © 2019 Grzesiek Kulesza. All rights reserved.
//

import UIKit

protocol GameResultDelegate: class {

    func backFromResult(transferredDataToGameVC: String)
}

class GameViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var LifeBarLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    var model = CardModel()
    var cardArray = [Card]()
    
    var missesTry = 0  // bad guess counter
    var endGame = false
    var winGameDate = ""
    var winGameTry = ""
    var winGameTime = ""
    
    var firstFlippedCardIndex: IndexPath?
    
    var timer:Timer?
    var milliseconds:Float = 30 * 1000 // 30 pseudo - seconds
    
    //Need for results count time elapsed and actual date
    let timeCountStartingPoint = Date()
    
    @IBAction func backButtonPressed(_ sender: Any) {
        backAction()
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "resultsVC", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Call the getCard method of the card model
        cardArray = model.getCards()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "ChemCardCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ChemCardCollectionViewCell")
        
        // Create timer
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(timerElapsed), userInfo: nil, repeats: true)
        //RunLoop.main.add(timer!, forMode: .common)
        
        // Set total lifepoints
        lifeBarPointsFill(ammount: lifeBarScotchAmmount)
        // Set time equal lifepoints on bar
        milliseconds = Float(lifeBarScotchAmmount * 1000)
    }

    override func viewDidAppear(_ animated: Bool) {
        
        // Play shuffle sound
        if (milliseconds >= Float(lifeBarScotchAmmount - 1) * 1000) { SoundManager.playSound(.shuffle) }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ResultsViewController {
            vc.winGameResultsData = (winGameDate,winGameTime,winGameTry)
            vc.delegate = self
        }
    }
    
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
    }
    
    // MARK: - Timer Methods
    @objc func timerElapsed() {
        
        milliseconds -= 1
        // Show and control live bar IIIIIII
        liveBar()
        
        //When the timer reached 0
        if milliseconds <= 0 {
            
            // Stop the timer
            timer?.invalidate()
            timerLabel.textColor = UIColor.red
            
            // Play sound
            SoundManager.playSound(.lose)
            
            // Check if there any cards unmatched
            checkGameEnded()
        }
    }
    
    // MARK: - UICollectionView Protocol Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return cardArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Get an CardCollectionViewCell object
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChemCardCollectionViewCell", for: indexPath) as! ChemCardCollectionViewCell
        
        // Get the card that the collection view is trying to display
        let card = cardArray[indexPath.row]
        
        //Set that crd for the cell
        cell.setCard(card)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //Check if there's any time left
        if milliseconds <= 0 {
            return
        }
        
        //Get cell that the user selected
        let cell = collectionView.cellForItem(at: indexPath) as! ChemCardCollectionViewCell
        
        //Get the card that the user selected
        let card = cardArray[indexPath.row]
        
        if card.isFliped == false && card.isMatched == false {
            
            // Flip the card
            cell.flip()
            
            // Play the flip sound
            SoundManager.playSound(.flip)
            
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    // MARK: - Game Logic Methods
    
    func checkForMatches(_ secondFlippedCardIndex: IndexPath) {
        
        // Get the cells for the two cards that were revealed
        let cardOneCell = collectionView.cellForItem(at: firstFlippedCardIndex!) as? ChemCardCollectionViewCell
        let cardTwoCell = collectionView.cellForItem(at: secondFlippedCardIndex) as? ChemCardCollectionViewCell
        
        
        // Get the cards for the two cards were revealed
        let cardOne = cardArray[firstFlippedCardIndex!.row]
        let cardTwo = cardArray[secondFlippedCardIndex.row]
        
        // Compare the two cards
        if cardOne.imageName == cardTwo.imageName {
            
            // It's a match
            
            // Play sound
            SoundManager.playSound(.match)
            
            // Set the status of the cards
            cardOne.isMatched = true
            cardTwo.isMatched = true
            
            // Remove the cards from the grid
            cardOneCell?.remove()
            cardTwoCell?.remove()
            
            //Check if there are any cards left unmatched
            checkGameEnded()
        }
        else {
            
            // It's not a match
            
            // Play Sound
            SoundManager.playSound(.nomatch)
            
            // Count misses
            missesTry += 1
            
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
    
    func checkGameEnded() {
    
    // Determine if there any cards unmached
    var isWon = true
        
        for card in cardArray {
            
            if card.isMatched == false {
                isWon = false
                break
            }
        }
        
    // Messeging variables
        var title = ""
        var message = ""
        
    //If not, then user has won, stop the timer
        if isWon == true {
            
            if milliseconds > 0 {
                timer?.invalidate()
                
                //Prepare result for segue
                winGameDate = actualDate()
                winGameTry = String(missesTry)
                winGameTime = String(self.timeCountStartingPoint.timeIntervalSinceNow * -1)
                
                // Play sound
                SoundManager.playSound(.win)
                
                // OPTIONAL: - Makes background brighter (or pulse completion)
                backgroundImage.alpha = 1
        
            }
            
            title = "Congratulations!"
            message = "You've won"
            endGame = true
        }
        else {
            // If there are unmatched cards, check if there's any time left
            
            if milliseconds > 0 {
                return
            }
            
            title = "Game Over"
            message = "You've lost"
            endGame = true
        }
    
        //Show won/lost messaging
        showAlert(title, message)

    }
    
    func showAlert(_ title: String, _ message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(alertAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func backAction(){
        //print("Back Button Clicked")
        timer?.invalidate()
        self.dismiss(animated: true, completion: nil)
    }
    
    func actualDate() -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        let result = formatter.string(from: timeCountStartingPoint)
        return result
    }
    
    func liveBar() {
        if (Int(milliseconds) % 1000 == 0) && (LifeBarLabel.text?.count != 0) {
            LifeBarLabel.text = String((LifeBarLabel.text?.dropLast())!)
        }
        
        let livePointsInBar = LifeBarLabel.text?.count ?? 0
        
        switch livePointsInBar {
        case 0...6:
            LifeBarLabel.textColor = UIColor.red
        case 7...19:
            LifeBarLabel.textColor = UIColor.yellow
        default:
            LifeBarLabel.textColor = UIColor.green
        }
        
    }
    
    func lifeBarPointsFill(ammount: Int) {
            LifeBarLabel.text = ""
        for _ in 0..<ammount {
            LifeBarLabel.text?.append("I")
        }
    }
    
    
} // End ViewControoler class

extension GameViewController: GameResultDelegate {
    func backFromResult(transferredDataToGameVC: String) {
        print("Wracamy z \(transferredDataToGameVC)")
         if endGame == true {
            backAction()
        }
    }
}
