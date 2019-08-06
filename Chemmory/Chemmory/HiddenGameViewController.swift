//
//  HiddenGameViewController.swift
//  Chemmory
//
//  Created by Grzesiek Kulesza on 29/07/2019.
//  Copyright © 2019 Grzesiek Kulesza. All rights reserved.
//

import UIKit

class HiddenGameViewController: UIViewController {

    
    @IBOutlet var playButtons: [UIButton]!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var memorySequenceArray: [Int] = []
    var playerMemorySequenceArray: [Int] = []
    var timer:Timer?
    var milliseconds:Float = 0
    var showingSpeed: Float = 0.01
    
    @IBOutlet weak var actualScore: UILabel!
    @IBOutlet weak var highScore: UILabel!
    var highScoreTemp: Int = 0
    
    
    var greyBorder: Bool = false
    
//    var isBorderColor0: Bool = false
//    var isBorderColor1: Bool = false
//    var isBorderColor2: Bool = false
//    var isBorderColor3: Bool = false
//    var isBorderColor4: Bool = false
//    var isBorderColor5: Bool = false
        var playing = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareGameBoardButtons()
        
    }
    
    @IBAction func gameBoardButtonTapped(_ sender: UIButton) {
        
//        guard (memorySequenceArray.count == playerMemorySequenceArray.count + 1) else {return scoreLabel.text = "outOfRage"}
//            playerMemorySequenceArray.append(sender.tag)
//            for i in 0..<playerMemorySequenceArray.count - 1 {
//                if playerMemorySequenceArray[i] != memorySequenceArray [i] {
//                 scoreLabel.text = "BAD"
//                } else {nextTurn()}
//                scoreLabel.text = "Good"
//            }
//            makeButtonColor(sender.tag)
        timer?.invalidate()
        allButtonsWhite()
        makeButtonColor(sender.tag)
        
        if playing == true {
        playerMemorySequenceArray.append(sender.tag)
        }
            
        if (memorySequenceArray.count == playerMemorySequenceArray.count), (playerMemorySequenceArray.count > 0)  {
            for i in 0...memorySequenceArray.count - 1 {
                if playerMemorySequenceArray[i] != memorySequenceArray [i] {
                    scoreLabel.text = "BAD"
                    resetGame()
                    playing = false
                    break
                }
            }
            
            if Int(milliseconds) > highScoreTemp {
                highScoreTemp = Int(milliseconds)
                highScore.text = String(highScoreTemp)
            }
            scoreLabel.text = "Good"
            actualScore.text = String(memorySequenceArray.count)
            nextTurn()
            
        }
        
        
    }
    
    
    @IBAction func startButtonTapped(_ sender: Any) {
            resetGame()
        guard milliseconds == 0 else {return}
            //timer?.invalidate()
            //resetGame()
            playing = true
            scoreLabel.text = ""
            nextTurn()
    }
    
    @IBAction func backButtonTaped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func allButtonsWhite() {
        for button in playButtons {
            button.backgroundColor = UIColor.white
            button.layer.borderColor = UIColor.white.cgColor
        }
    }
    
    func firstTurnGame() {
        // TODO do some stuff here
        
    }
    
    func nextTurn() {
        // TODO keep buttons not clicable
        //timer?.invalidate()
        playing = true
        playerMemorySequenceArray = []
        memorySequenceArray.append(Int.random(in: 0 ... 4))
        milliseconds = 0
        showingSpeed = 0.01
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(timerElapsed), userInfo: nil, repeats: true)
    }
    
    func makeButtonColor(_ tag: Int, isGreyBorderColor: Bool? = false) {
        
        isGreyBorderColor == true ? (playButtons[tag].layer.borderColor = UIColor.yellow.cgColor) : (playButtons[tag].layer.borderColor = UIColor.white.cgColor)
        
        switch tag {
        case 1:
            playButtons[tag].backgroundColor = UIColor.cyan
//            isBorderColor1 == true ? (playButtons[tag].layer.borderColor = UIColor.cyan.cgColor) : (playButtons[tag].layer.borderColor = UIColor.white.cgColor)
//            isBorderColor1 = !isBorderColor1
        case 2:
            playButtons[tag].backgroundColor = UIColor.green
//            isBorderColor2 == true ? (playButtons[tag].layer.borderColor = UIColor.green.cgColor) : (playButtons[tag].layer.borderColor = UIColor.white.cgColor)
//            isBorderColor2 = !isBorderColor2
        case 3:
            playButtons[tag].backgroundColor = UIColor.blue
//            isBorderColor3 == true ? (playButtons[tag].layer.borderColor = UIColor.blue.cgColor) : (playButtons[tag].layer.borderColor = UIColor.white.cgColor)
//            isBorderColor3 = !isBorderColor3
        case 4:
            playButtons[tag].backgroundColor = UIColor.red
//            isBorderColor4 == true ? (playButtons[tag].layer.borderColor = UIColor.red.cgColor) : (playButtons[tag].layer.borderColor = UIColor.white.cgColor)
//            isBorderColor4 = !isBorderColor4
        default:
            playButtons[tag].backgroundColor = UIColor.yellow
//            isBorderColor0 == true ? (playButtons[tag].layer.borderColor = UIColor.yellow.cgColor) : (playButtons[tag].layer.borderColor = UIColor.white.cgColor)
//            isBorderColor0 = !isBorderColor0
        }
    }
    
    func prepareGameBoardButtons() {
        for button in playButtons {
            button.layer.cornerRadius = 10
            button.layer.borderWidth = 3
            button.layer.borderColor = UIColor.white.cgColor
        }
        
    }
    
    func resetGame() {
        
        playerMemorySequenceArray = []
        memorySequenceArray = []
        milliseconds = 0
        showingSpeed = 0.01
        allButtonsWhite()
        timer?.invalidate()
    }
    
    // MARK: - Timer Methods
    @objc func timerElapsed() {
        
        milliseconds += showingSpeed
        let milInt = Int(milliseconds)

        scoreLabel.text = String(format: "%.8f", milliseconds)
        
        let actualSequenceTag: Int = milInt % memorySequenceArray.count
        // make grey borderColor
        
//        if memorySequenceArray.count > 1, actualSequenceTag > 0, memorySequenceArray[actualSequenceTag] ==  memorySequenceArray[actualSequenceTag - 1], !greyBorder {
//            greyBorder = true
//        } else if greyBorder == true { greyBorder = false}
//        else { greyBorder = false}
        
        allButtonsWhite()
        makeButtonColor(memorySequenceArray[actualSequenceTag], isGreyBorderColor: greyBorder)
        if memorySequenceArray.count == actualSequenceTag {
            milliseconds = 0
        }
        //When the timer reached max
        if milInt >= memorySequenceArray.count {
            // Stop the timer
            timer?.invalidate()
            allButtonsWhite()
        }

    }
    
}
