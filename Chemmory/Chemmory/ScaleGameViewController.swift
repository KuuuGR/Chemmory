//
//  ScaleGameViewController.swift
//  Chemmory
//
//  Created by Grzesiek Kulesza on 26/08/2019.
//  Copyright © 2019 Grzesiek Kulesza. All rights reserved.
//

import UIKit

class ScaleGameViewController: UIViewController {

    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var comparisonLabel: UILabel!
    @IBOutlet weak var emojiLabel: UILabel!
    
    @IBOutlet weak var winLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    var elementsOnScale:[Int] = [1,0]
    var firstElementIsHeavier: Bool = false
    var scaleQuestion = Int.random(in: 0...1)
    var points: Int = 0
    var round: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        prepareButton(leftButton)
        prepareButton(rightButton)
        waitForAnswer()
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func answerButtonTapped(_ sender: UIButton) {
       
        let firstElementIsHeavier: Bool = elementsOnScale[0] > elementsOnScale[1]
        let selectedElementShouldBeHevier: Bool = scaleQuestion == 0
        let userChooseFirstElement: Bool = sender.tag == 0
        
        if userChooseFirstElement && firstElementIsHeavier && selectedElementShouldBeHevier ||
           userChooseFirstElement && !firstElementIsHeavier && !selectedElementShouldBeHevier ||
           !userChooseFirstElement && firstElementIsHeavier && !selectedElementShouldBeHevier ||
           !userChooseFirstElement && !firstElementIsHeavier && selectedElementShouldBeHevier
            {
            goodAnswer()
        } else {
            badAnswer()
        }
    
    }
    
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        SoundManager.playSound(.back)
        self.navigationController?.popViewController(animated: true)
    }
    
    func prepareButton(_ button: UIButton){
        
       // TODO: make background colors as a element has in table of elements
                //button.backgroundColor = .clear
                button.backgroundColor = .gray
                button.layer.cornerRadius = 25
                button.layer.borderWidth = 3
                button.layer.borderColor = UIColor.white.cgColor
                button.setTitleColor(.white, for: .normal)
    }
    
    func waitForAnswer(){
        elementsOnScale = prepareRandomQuestion(112)
        let titleEl1 = elements[elementsOnScale[0]].symbol
        let titleEl2 = elements[elementsOnScale[1]].symbol
        leftButton.setTitle(titleEl1, for: .normal)
        rightButton.setTitle(titleEl2, for: .normal)
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500), execute: {
            self.emojiLabel.text = "🧐"
        })
        self.scaleQuestion = Int.random(in: 0...1)
        scaleQuestion == 0 ? (comparisonLabel.text = "heavier".localized) : (comparisonLabel.text = "lightest".localized)
        
    }
    
    func goodAnswer(){
        points += 1
        emojiLabel.text = "🤗"
        SoundManager.playSound(.correct)
        nextRound()
    }
    
    func badAnswer(){
        points -= 1
        emojiLabel.text = "🥶"
        SoundManager.playSound(.wrong)
        nextRound()
    }
    
    func nextRound(){
        round += 1
        roundLabel.text = "Round: \(round)"
        winLabel.text = "win: \(points)"
        waitForAnswer()
        
    }
    
    func prepareRandomQuestion(_ maxQuestion: Int) -> [Int] {
        let numberOfQuestions = 2
        var questions: Set<Int> = []
        while questions.count < numberOfQuestions {
            questions.insert(Int.random(in: 1...maxQuestion))
        }
        return questions.shuffled()
    }
}
