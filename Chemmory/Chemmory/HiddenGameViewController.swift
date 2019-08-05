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
    
    var memorySequenceArray: [Int] = [1,1,1,1,1,2,3,3]
    
    var timer:Timer?
    var milliseconds:Float = 0
    var showingSpeed: Float = 0.01
    
    var greyBorder: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareGameBoardButtons()
        
    }
    
    
    @IBAction func gameBoardButtonTapped(_ sender: UIButton) {
       
        makeButtonColor(sender.tag)
        
    }
    
    
    @IBAction func startButtonTapped(_ sender: Any) {
        
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
        case 2:
            playButtons[tag].backgroundColor = UIColor.green
        case 3:
            playButtons[tag].backgroundColor = UIColor.blue
        case 4:
            playButtons[tag].backgroundColor = UIColor.red
        default:
            playButtons[tag].backgroundColor = UIColor.yellow
        }
    }
    
    func prepareGameBoardButtons() {
        for button in playButtons {
            //button.backgroundColor = .clear
            button.layer.cornerRadius = 10
            button.layer.borderWidth = 3
            button.layer.borderColor = UIColor.white.cgColor
        }
        
    }
    
    // MARK: - Timer Methods
    @objc func timerElapsed() {
        
        milliseconds += showingSpeed
        let milInt = Int(milliseconds)

        scoreLabel.text = String(milliseconds)
        allButtonsWhite()
        
        let actualSequenceTag: Int = milInt % memorySequenceArray.count
        
        
        // make grey borderColor
        
        if memorySequenceArray.count > 1, actualSequenceTag > 0, memorySequenceArray[actualSequenceTag] ==  memorySequenceArray[actualSequenceTag - 1], !greyBorder {
            greyBorder = !greyBorder
        } else if greyBorder == true { greyBorder = false}
        else { greyBorder = false}
        
        makeButtonColor(memorySequenceArray[actualSequenceTag], isGreyBorderColor: greyBorder)
        
        //When the timer reached max
        if milInt >= memorySequenceArray.count {
            // Stop the timer
            timer?.invalidate()
            allButtonsWhite()
        }

    }
    
}
