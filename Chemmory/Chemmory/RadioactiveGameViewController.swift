//
//  RadioactiveGameViewController.swift
//  Chemmory
//
//  Created by Grzesiek Kulesza on 02/09/2019.
//  Copyright © 2019 Grzesiek Kulesza. All rights reserved.
//

import UIKit

class RadioactiveGameViewController: UIViewController {

    @IBOutlet weak var elementBackgroundView: UIView!
    @IBOutlet weak var atomicNumberLabel: UILabel!
    @IBOutlet weak var atomicNameLabel: UILabel!
    @IBOutlet weak var atomicSymbolLabel: UILabel!
    @IBOutlet weak var atomicMassLabel: UILabel!
    
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var corretLabel: UILabel!
    
    @IBOutlet weak var barrelOneButton: UIButton!
    @IBOutlet weak var barrelTwoButton: UIButton!
    @IBOutlet weak var barrelThreeButton: UIButton!
    
    @IBOutlet weak var bigImageView: UIImageView!
    
    var randomElementNumber = Int.random(in: 1...112)
    //var randomElementNumber = 1
    
    var correctAnsCount: Int = 0
    var levelCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareMainElementLook()
        prepareMainElementValues()
        prepareScoreLabels()
        
    }
    
    @IBAction func nuclearButtonPressed(_ sender: UIButton) {
    
        checkIsElementRadioactive() ? correctAnswer() : incorrectAnswer()
        
        levelCount += 1
        randomElementNumber = Int.random(in: 1...112)
        prepareMainElementValues()
    }
    
    @IBAction func stableElementButtonPressed(_ sender: UIButton) {
        
        checkIsElementRadioactive() ? incorrectAnswer() : correctAnswer()

        levelCount += 1
        randomElementNumber = Int.random(in: 1...112)
        prepareMainElementValues()
    }
    
    
    @IBAction func barrelButtonPressed(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            self.bigImageView.image = #imageLiteral(resourceName: "nuclearBoom01")
        case 1:
            bigImageView.image = #imageLiteral(resourceName: "nuclearBoom02")
        case 2:
            bigImageView.image = #imageLiteral(resourceName: "nuclearBoom03")
        default:
            return
        }
        
        bigImageView.alpha = 0.0
        UIView.animate(withDuration: 5.25, animations: {
            self.bigImageView.alpha = 1.0
        })
        UIView.animate(withDuration: 5.25, animations: {
            self.bigImageView.alpha = 0.0
        })
        
    }
    
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        SoundManager.playSound(.back)
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    func prepareMainElementLook(){
        elementBackgroundView.layer.cornerRadius = 15.0
        elementBackgroundView.layer.borderColor = UIColor.white.cgColor
        elementBackgroundView.layer.borderWidth = 5
        elementBackgroundView.backgroundColor = .black
        elementBackgroundView.clipsToBounds = true
    }
    
    func prepareMainElementValues(){
        atomicNumberLabel.text = String(randomElementNumber)
        atomicNameLabel.text = elements[randomElementNumber].name
        atomicSymbolLabel.text = elements[randomElementNumber].symbol
        atomicMassLabel.text = String(Int(elements[randomElementNumber].atomicMass))
    }
    
    func checkIsElementRadioactive() -> Bool {
        if randomElementNumber < stableElementsArray2D.count {
        return !stableElementsArray2D[randomElementNumber].contains(Int(elements[randomElementNumber].atomicMass))
        } else {
            return true
        }
    }
    
    func correctAnswer() {
        correctAnsCount += 1
        prepareScoreLabels()
        
        switch correctAnsCount {
        case (10...100):
            prepareBarBarrel(001)
            barrelThreeButton.isEnabled = true
        case (101...1000):
            prepareBarBarrel(011)
            barrelTwoButton.isEnabled = true
        case (1001...10000):
            prepareBarBarrel(111)
            barrelOneButton.isEnabled = true
        default:
            prepareBarBarrel(000)
        }
    }
    
    func incorrectAnswer() {
        correctAnsCount -= 1
        prepareScoreLabels()
    }
    
    func prepareBarBarrel(_ barrelSequence: Int){
        
        switch barrelSequence {
            
        case 001:
            barrelOneButton.setImage(#imageLiteral(resourceName: "nuclearBarrelBig"), for: .normal)
            barrelTwoButton.setImage(#imageLiteral(resourceName: "nuclearBarrelBig"), for: .normal)
            barrelThreeButton.setImage(#imageLiteral(resourceName: "nuclearBarrelBigLiquid"), for: .normal)
        case 011:
            barrelOneButton.setImage(#imageLiteral(resourceName: "nuclearBarrelBig"), for: .normal)
            barrelTwoButton.setImage(#imageLiteral(resourceName: "nuclearBarrelBigLiquid"), for: .normal)
            barrelThreeButton.setImage(#imageLiteral(resourceName: "nuclearBarrelBigLiquid"), for: .normal)
        case 111:
            barrelOneButton.setImage(#imageLiteral(resourceName: "nuclearBarrelBigLiquid"), for: .normal)
            barrelTwoButton.setImage(#imageLiteral(resourceName: "nuclearBarrelBigLiquid"), for: .normal)
            barrelThreeButton.setImage(#imageLiteral(resourceName: "nuclearBarrelBigLiquid"), for: .normal)
        default:
            barrelOneButton.setImage(#imageLiteral(resourceName: "nuclearBarrelBig"), for: .normal)
            barrelTwoButton.setImage(#imageLiteral(resourceName: "nuclearBarrelBig"), for: .normal)
            barrelThreeButton.setImage(#imageLiteral(resourceName: "nuclearBarrelBig"), for: .normal)
        }
    }
    
    func prepareScoreLabels(){
        levelLabel.text = "Level: \(levelCount)"
        corretLabel.text = "correct: \(correctAnsCount)"
    }
    
}


