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
    @IBOutlet weak var repeatSameAnswerButton: UIButton!
    @IBOutlet weak var actualScore: UILabel!
    @IBOutlet weak var highScore: UILabel!
    @IBOutlet var highScoreFruitLabels: [UIImageView]!
    
    var memorySequenceArray: [Int] = []
    var playerMemorySequenceArray: [Int] = []
    var timer:Timer?
    var milliseconds:Float = 0
    var showingSpeed: Float = 0.008
    
    var highScoreTemp: Int = 0
    
    var allowRepQues: Bool = true
    
    var greyBorder: Bool = false
    var playing = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareGameBoardButtons()
        hideFruits()
        
    }
    
    deinit {
        playButtons.removeAll()
        highScoreFruitLabels.removeAll()
    }
    
    @IBAction func gameBoardButtonTapped(_ sender: UIButton) {
        
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
                SoundManager.playSound(.record)
            }
            scoreLabel.text = "Good"
            actualScore.text = String(memorySequenceArray.count)
            showMyFruit(memorySequenceArray.count)
            nextTurn()
        }
    }
    
    @IBAction func startButtonTapped(_ sender: Any) {
        SoundManager.playSound(.hPlay)
            resetGame()
        guard milliseconds == 0 else {return}
            playing = true
            scoreLabel.text = ""
            nextTurn()
    }
    
    @IBAction func backButtonTaped(_ sender: UIButton) {
        SoundManager.playSound(.hBack)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func repeatSameAnswerButtonPush(_ sender: UIButton) {
        SoundManager.playSound(.noRep)
        allowRepQues = !allowRepQues
        allowRepQues == true ? sender.setImage(#imageLiteral(resourceName: "RepeatYes"), for: .normal) : sender.setImage(#imageLiteral(resourceName: "RepeatNo"), for: .normal)
    }
    
    func allButtonsWhite() {
        for button in playButtons {
            button.backgroundColor = UIColor.white
            button.layer.borderColor = UIColor.white.cgColor
        }
    }
    
    func nextTurn() {
        // TODO keep buttons not clicable
        playing = true
        playerMemorySequenceArray = []
        
        memorySequenceArray = appendWithRepeatitions(memorySequenceArray,allowRepQues)
        
        milliseconds = 0
        timer = Timer.scheduledTimer(timeInterval: Double(showingSpeed), target: self, selector: #selector(timerElapsed), userInfo: nil, repeats: true)
    }
    
    func makeButtonColor(_ tag: Int, isGreyBorderColor: Bool? = false) {
        
        isGreyBorderColor == true ? (playButtons[tag].layer.borderColor = UIColor.yellow.cgColor) : (playButtons[tag].layer.borderColor = UIColor.white.cgColor)
        
        switch tag {
        case 1:
            playButtons[tag].backgroundColor = UIColor.cyan
           // SoundManager.playSound(.up)

        case 2:
            playButtons[tag].backgroundColor = UIColor.green
           // SoundManager.playSound(.right)

        case 3:
            playButtons[tag].backgroundColor = UIColor.blue
           // SoundManager.playSound(.down)

        case 4:
            playButtons[tag].backgroundColor = UIColor.red
           // SoundManager.playSound(.left)

        default:
            playButtons[tag].backgroundColor = UIColor.yellow
           // SoundManager.playSound(.middle)

        }
    }
    
    func appendWithRepeatitions(_ array: [Int], _ allowRepeat: Bool) -> [Int] {
        var output = array
        var randomDigit = Int.random(in: 0 ... 4)
        if allowRepeat == true {
           output.append(randomDigit)
        } else {
            while array.last == randomDigit {
                randomDigit = Int.random(in: 0 ... 4)
            }
            output.append(randomDigit)
        }
        return output
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
        hideFruits()
    }
    
    func showMyFruit(_ score: Int) {
        switch score {
        case 5:
            highScoreFruitLabels[0].isHidden = false
        case 10:
            highScoreFruitLabels[1].isHidden = false
        case 15:
            highScoreFruitLabels[2].isHidden = false
        case 20:
            highScoreFruitLabels[3].isHidden = false
        case 30:
            highScoreFruitLabels[4].isHidden = false
        case 50:
            highScoreFruitLabels[5].isHidden = false
            
        default: return
        }
    
    }
    
    func hideFruits(){
        for fruit in highScoreFruitLabels {
            fruit.isHidden = true
        }
    }
    
    // MARK: - Timer Methods
    @objc func timerElapsed() {
        
        milliseconds += showingSpeed
        let milInt = Int(milliseconds)
        //scoreLabel.text = String(format: "%.8f", milliseconds)

        let actualSequenceTag: Int = milInt % memorySequenceArray.count
        
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
