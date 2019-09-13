//
//  noFiveMiniGameViewController.swift
//  Chemmory
//
//  Created by Grzesiek Kulesza on 11/09/2019.
//  Copyright © 2019 Grzesiek Kulesza. All rights reserved.
//

import UIKit

class noFiveMiniGameViewController: UIViewController {

    @IBOutlet weak var centralSaveButton: UIButton!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var winLabel: UILabel!
    
    @IBOutlet weak var medal1: UIImageView!
    @IBOutlet weak var medal2: UIImageView!
    @IBOutlet weak var medal3: UIImageView!
    @IBOutlet weak var medal4: UIImageView!
    
    @IBOutlet var allButtons: [UIButton]!
    
    var question: [Int] = [0,0,0,0,0,0,0,0,0,0,0,0]
    var winCounter: Int = 0
    var roundCounter: Int = 0
    var answer: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareButton(centralSaveButton)
        
        
        for button in allButtons { prepareButton(button) }
 
        answer = Int.random(in: 1...112)
        question = prepareRandomAnswers(answer, 112)
        setButtonsValues()
        let buttonChoosen = showOnlyRandomOne()
        answer = question[buttonChoosen]
        print(answer)

    }
    
    @IBAction func centralSaveButton(_ sender: UIButton) {
        SoundManager.playSound(.up)
        roundCounter += 1
        
        refreshScoreLabels()
        
        showAllButtons()
        centralSaveButton.isEnabled = false
        
        question = prepareRandomAnswers(answer, 112)
        setButtonsValues()
        
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        if question[sender.tag] == answer {
            SoundManager.playSound(.correct)
            winCounter += 1
            showAwards(winCounter)
        } else {SoundManager.playSound(.wrong)}
        refreshScoreLabels()
        
        let buttonChoosen = showOnlyRandomOne()
        answer = question[buttonChoosen]
        centralSaveButton.isEnabled = true
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        SoundManager.playSound(.back)
        self.navigationController?.popViewController(animated: true)
    }
    
    func setButtonsValues (){
        for button in allButtons {
            setButtonsLabels(button, question[button.tag])
        }
    }
    
    func setButtonsLabels (_ button: UIButton, _ attomicNumber: Int) {
        
        button.titleLabel?.lineBreakMode = .byWordWrapping
        let massText = String(format: "%.02f", elements[attomicNumber].atomicMass)
        let symbolText = elements[attomicNumber].symbol
        button.setTitle("\(attomicNumber)\n    \(symbolText)\n  \(massText)", for: .normal)
    }
    
    func prepareButton(_ button: UIButton){
        
        button.backgroundColor = .gray
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.setTitleColor(.white, for: .normal)
       
    }
    
    func showOnlyRandomOne() -> Int {
        
        let randBut = Int.random(in: 0...11)
        
        for button in allButtons {
            if button.tag != randBut {
                button.isHidden = true
            }
                button.isEnabled = false
        }
        
        return randBut
    }
    
    func prepareRandomAnswers(_ correctAnswer: Int,_ maxAnswer: Int) -> [Int] {
        let numberOfAnswers = 12
        var answers: Set<Int> = [correctAnswer]
        while answers.count < numberOfAnswers {
            answers.insert(Int.random(in: 1...maxAnswer))
        }
        return answers.shuffled()
    }
    
    func showAllButtons() {
        for button in allButtons{
            button.isHidden = false
            button.isEnabled = true
        }
        
    }
    
    func refreshScoreLabels() {
        winLabel.text = String(winCounter)
        roundLabel.text = String(roundCounter)
    }
    
    func showAwards(_ wins: Int){
        
        switch wins {
        case 10...49:
            medal1.isHidden = false
        case 50...99:
            medal2.isHidden = false
        case 100...399:
            medal3.isHidden = false
        case 400...999:
            medal4.isHidden = false
        case 1000...1999:
            centralSaveButton.setImage(#imageLiteral(resourceName: "miniVSaveGold"), for: .normal)
        case 2000...4999:
            centralSaveButton.setImage(#imageLiteral(resourceName: "miniVSaveClock"), for: .normal)
        case 5000...20000:
            centralSaveButton.setImage(#imageLiteral(resourceName: "rinbowStar"), for: .normal)
        default:
            return
        }

    }

}
