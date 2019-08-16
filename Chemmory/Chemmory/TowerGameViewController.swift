//
//  TowerGameViewController.swift
//  Chemmory
//
//  Created by Grzesiek Kulesza on 14/08/2019.
//  Copyright © 2019 Grzesiek Kulesza. All rights reserved.
//

import UIKit

class TowerGameViewController: UIViewController {

    var questionNumber = 1
    var answer: [Int] = [0,0,0,0,0]
    @IBOutlet weak var towerImageView: UIImageView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var answerButons: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareButtons()
        
        answer = prepareRandomAnswers(questionNumber, answer, 112)
        //signAnswerButtonsValues()
        setAnswerButtonsChemicalNames()
    }

    @IBAction func backButtonTapped(_ sender: UIButton) {
        SoundManager.playSound(.back)
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func answerButtoTapped(_ sender: UIButton) {
       
        answer[sender.tag] == questionNumber ? (SoundManager.playSound(.down)) : (SoundManager.playSound(.results))
        answer[sender.tag] == questionNumber ? (questionNumber += 1) : (questionNumber = 1)
        questionLabel.text = String(questionNumber)
        answer = prepareRandomAnswers(questionNumber, answer, 112)
        //signAnswerButtonsValues()
        setAnswerButtonsChemicalNames()
        showPartPicture(questionNumber, 112)
    }
    
    
    func prepareButtons(){
        // round corners in image of the tower
        towerImageView.layer.cornerRadius = 16.0
        towerImageView.clipsToBounds = true
        
        // round corners and prepare answer buttons
        for button in answerButons {
            button.backgroundColor = .clear
            button.layer.cornerRadius = 15
            button.layer.borderWidth = 3
            button.layer.borderColor = UIColor.white.cgColor
        }
        
        // round corners question laber
        questionLabel.layer.cornerRadius = 15
        questionLabel.layer.borderColor = UIColor.white.cgColor
        questionLabel.layer.borderWidth = 3
        questionLabel.layer.masksToBounds = true
        
    }
    
    func showPartPicture(_ currntValue: Int,_ maxValue: Int) {
        let picNumber = Float(currntValue)/Float(maxValue) * 24
        let imageName = "puzzle" + String(Int(picNumber)) + ".png"
        towerImageView.image = UIImage(named: imageName)
    }
    
    func prepareRandomAnswers(_ trueValue: Int, _ answers: [Int], _ maxAnswer: Int) -> [Int] {
        var newAnswers = answers
        var randomInt = 1
        newAnswers[0] = trueValue
        
        // TODO: remove repetition of elements
        for i in 1...4 {
            repeat {
                randomInt = Int.random(in: 1...maxAnswer)
                newAnswers[i] = randomInt
            } while !(newAnswers.contains(randomInt))
        }
        
        newAnswers = newAnswers.shuffled()
        return newAnswers
    }
    
    func signAnswerButtonsValues(){
        for button in answerButons {
            button.setTitle(String(answer[button.tag]), for: .normal)
        }
    }
    
    func setAnswerButtonsChemicalNames(){
        for button in answerButons {
            button.setTitle(elements[answer[button.tag]].symbol, for: .normal)
        }
    }
 
}
