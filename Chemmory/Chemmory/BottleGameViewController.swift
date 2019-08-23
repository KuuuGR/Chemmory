//
//  BottleGameViewController.swift
//  Chemmory
//
//  Created by Grzesiek Kulesza on 20/08/2019.
//  Copyright © 2019 Grzesiek Kulesza. All rights reserved.
//

import UIKit

class BottleGameViewController: UIViewController {
    
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var winLabel: UILabel!
    
    @IBOutlet weak var centerBottleButton: UIButton!
    @IBOutlet var questButtons: [UIButton]!
    @IBOutlet var answerButtons: [UIButton]!
    @IBOutlet var answerABCdLabels: [UILabel]!
    
    
    var rotAngle = Int.random(in: 0...7)
    var round: Int = 0
    var winCounter: Int = 0
    var question: [Int] = [0,0,0,0,0,0,0,0]
    var answer: [Int] = [0,0,0,0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareQuestionButtons()
        answerTurnIsNow(false)
        
        centerBottleButton.rotate()
        UIView.animate(withDuration: durationAnimation, delay: 0, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
            }, completion: {
                (true) in self.centerBottleButton.stopRotating()
            })
        
        let bottleImage  = UIImage(named: "bottle" + String(Int.random(in: 0...5)) + ".png")
        centerBottleButton.setImage(bottleImage, for: .normal)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        SoundManager.playSound(.back)
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func answerButtonTapped(_ sender: UIButton) {
        if answer[sender.tag] == question[rotAngle] {
            SoundManager.playSound(.correct)
            winCounter += 1
        } else {
            SoundManager.playSound(.wrong)
            winCounter -= 1
            
        }
        winLabel.text = ("win: \(winCounter)")
        answerTurnIsNow(false)
        
    }
    
    
    @IBAction func bottleButtonTapped(_ sender: UIButton) {
        
        round += 1
        roundLabel.text = "Round \(round)"
        
        for button in questButtons {
            button.backgroundColor = UIColor.clear
        }
        
        // make the draw with no repetitions
        let rotAngleMemo = rotAngle
        while rotAngleMemo == rotAngle {
           rotAngle = Int.random(in: 0...7)
        }
        
        let rotAngleCG = CGFloat(rotAngle) * 0.78539816339
//        let rotDeg = (rotAngleCG * 360 / 2 / 3.141592653589793)
//        print(rotDeg.rounded())
//        print(rotAngle)
        
        
        // bottle rotation animation
        UIView.animate(withDuration: 1.25, animations: {
            self.centerBottleButton.transform = CGAffineTransform(rotationAngle: rotAngleCG)
        })
        // draw coloring animation
        UIView.animate(withDuration: 3.5, animations: {
            self.questButtons[self.rotAngle].backgroundColor = UIColor.chOtherNonMetals
            //self.questButtons[self.rotAngle].titleLabel?.textColor = UIColor.black
            //self.questButtons[self.rotAngle].layer.borderColor = UIColor.yellow.cgColor
        })
        
        question = prepareRandomQuestion(112)
        answer = prepareRandomAnswers(question[rotAngle], 112)
        
        print("questins: \(question)")
        print("answers: \(answer)")
        
        setQuestionsAndAnswersLabels()
        
        //wait till answer is tapped
        centerBottleButton.isEnabled = false
        answerTurnIsNow(true)
        
    }
    
    func answerTurnIsNow(_ isNow: Bool) {
        centerBottleButton.isEnabled = !isNow
        prepareAnswerButtonsActive(isNow)
    }
    
    func prepareAnswerButtonsActive(_ isActive: Bool){
        if isActive == true {
            for button in answerButtons {
                button.isEnabled = isActive
                UIView.animate(withDuration: 2.0, animations: {
                    button.titleLabel?.textColor = .darkGray
                    button.setTitleColor(.white, for: .normal)
                    button.backgroundColor = UIColor.blue
                })
            }
            for label in answerABCdLabels {
                label.textColor = UIColor.white
            }
            
        }else {
            for button in answerButtons {
                button.isEnabled = false
                button.backgroundColor = .darkGray
                //button.titleLabel?.textColor = .yellow
                button.setTitleColor(.gray, for: .normal)
                
                // color red - wrong answer and green good answer
                let value = Int(button.titleLabel?.text ?? "0")
                value == question[rotAngle] ? button.setTitleColor(UIColor.chPoorMetals, for: .normal) : button.setTitleColor(UIColor.chHydrogen, for: .normal)
                
            }
            for label in answerABCdLabels {
                label.textColor = UIColor.gray
            }
        }
    }
    
    
    func prepareQuestionButtons(){
        
        for button in questButtons {
            button.backgroundColor = .clear
            button.layer.cornerRadius = 25
            button.layer.borderWidth = 3
            button.layer.borderColor = UIColor.white.cgColor
        }
    }
    
    func prepareRandomAnswers(_ correctAnswer: Int,_ maxAnswer: Int) -> [Int] {
        let numberOfAnswers = 4
        var answers: Set<Int> = [correctAnswer]
        while answers.count < numberOfAnswers {
            answers.insert(Int.random(in: 1...maxAnswer))
        }
        return answers.shuffled()
    }
    
    func prepareRandomQuestion(_ maxQuestion: Int) -> [Int] {
        let numberOfQuestions = 8
        var questions: Set<Int> = []
        while questions.count < numberOfQuestions {
            questions.insert(Int.random(in: 1...maxQuestion))
        }
        return questions.shuffled()
    }
    
    func setQuestionsAndAnswersLabels(){
        for i in 0...7 {
            let elementNumber = question[i]
            questButtons[i].setTitle(elements[elementNumber].symbol, for: .normal)
        }
        for i in 0...3 {
            answerButtons[i].setTitle("\(answer[i])", for: .normal)
        }
    }
    
}
