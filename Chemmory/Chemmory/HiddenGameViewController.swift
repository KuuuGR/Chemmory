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
    
    var memorySequenceArray: [Int] = [1,2,3,4,1,2,3,4,0]
    
    var timer:Timer?
    var milliseconds:Float = 0
    var showingSpeed: Float = 0.01
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create timer
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(timerElapsed), userInfo: nil, repeats: true)
        //RunLoop.main.add(timer!, forMode: .common)
        //self.firstTurnGame()

    }
    
    
    
    @IBAction func playButtonTapped(_ sender: UIButton) {
       
        allButtonsWhite()
        makeButtonColor(sender.tag)
        
    }
    
    
    @IBAction func startButtonTapped(_ sender: Any) {
        allButtonsWhite()
        scoreLabel.text = ""
    }
    
    @IBAction func backButtonTaped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func allButtonsWhite() {
        for button in playButtons {
            button.backgroundColor = UIColor.white
        }
    }
    
    func firstTurnGame() {
        memorySequenceArray.append(Int.random(in: 0 ... 4))
    
//        for memmiks in memorySequenceArray {
//                self.makeButtonColor(memmiks)
//        }
        
        
    }
    
    func makeButtonColor(_ tag: Int) {
        
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
    
    // MARK: - Timer Methods
    @objc func timerElapsed() {
        
        milliseconds += showingSpeed
        let milInt = Int(milliseconds)
        
        //When the timer reached max
        if milInt >= memorySequenceArray.count {
            // Stop the timer
            timer?.invalidate()
        }

        scoreLabel.text = String(milliseconds)
        allButtonsWhite()
 
        makeButtonColor(memorySequenceArray[milInt % memorySequenceArray.count])
        
        
    }
    
}
