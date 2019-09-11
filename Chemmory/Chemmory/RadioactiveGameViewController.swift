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
    @IBOutlet weak var incorrectLabel: UILabel!
    
    
    @IBOutlet weak var imageCorrectWrongImageView: UIImageView!
    
    @IBOutlet weak var barrelOneButton: UIButton!
    @IBOutlet weak var barrelTwoButton: UIButton!
    @IBOutlet weak var barrelThreeButton: UIButton!
    
    @IBOutlet weak var bigImageView: UIImageView!
    
    var randomElementNumber = Int.random(in: 1...112)
    var atomicIsotopeMass: Int = 0
    
    var correctAnsCount: Int = 0
    var incorrectAnsCount: Int = 0
    var levelCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        atomicIsotopeMass = randomIsotopeMass(randomElementNumber)
        
        prepareMainElementLook()
        prepareMainElementValues()
        prepareScoreLabels()
        
    }
    
    @IBAction func nuclearButtonPressed(_ sender: UIButton) {
    
        checkIsElementRadioactive() ? correctAnswer() : incorrectAnswer()
        
        levelCount += 1
        randomElementNumber = Int.random(in: 1...112)
        atomicIsotopeMass = randomIsotopeMass(randomElementNumber)
        
        prepareMainElementValues()
    }
    
    @IBAction func stableElementButtonPressed(_ sender: UIButton) {
        
        checkIsElementRadioactive() ? incorrectAnswer() : correctAnswer()

        levelCount += 1
        randomElementNumber = Int.random(in: 1...112)
        atomicIsotopeMass = randomIsotopeMass(randomElementNumber)
        
        prepareMainElementValues()
    }
    
    
    @IBAction func barrelButtonPressed(_ sender: UIButton) {
        
        SoundManager.playSound(.nukExplosion)
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
    
    
    @IBAction func helpButtonPressed(_ sender: UIButton) {
        checkIsElementRadioactive() ? (elementBackgroundView.backgroundColor = UIColor.red) : (elementBackgroundView.backgroundColor = UIColor.green)
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
        //atomicMassLabel.text = String(Int(elements[randomElementNumber].atomicMass))
        atomicMassLabel.text = String(atomicIsotopeMass)
        elementBackgroundView.backgroundColor = .black // this is necessary for help button
    }
    
    func checkIsElementRadioactive() -> Bool {
        if randomElementNumber < stableElementsArray2D.count {
        //return !stableElementsArray2D[randomElementNumber].contains(Int(elements[randomElementNumber].atomicMass))
            return !stableElementsArray2D[randomElementNumber].contains(atomicIsotopeMass)
        } else {
            return true
        }
    }
    
    func correctAnswer() {
        
        SoundManager.playSound(.nukCorrect)
        correctAnimation()
        correctAnsCount += 1
        prepareScoreLabels()
        
        switch correctAnsCount {
        case (10...99):
            if incorrectAnsCount < 1 {
                prepareBarBarrel(001)
                barrelThreeButton.isEnabled = true
            }
        case (100...499):
            if incorrectAnsCount < 10 {
                prepareBarBarrel(011)
                barrelTwoButton.isEnabled = true
            }
        case (500...5000):
            if incorrectAnsCount < 20 {
                prepareBarBarrel(111)
                barrelOneButton.isEnabled = true
            }
        default:
            prepareBarBarrel(000)
        }
    }
    
    func incorrectAnswer() {
        
        SoundManager.playSound(.nukWrong)
        wrongAnimation()
        incorrectAnsCount += 1
        prepareScoreLabels()
    }
    
    func correctAnimation() {
        imageCorrectWrongImageView.image = #imageLiteral(resourceName: "nukOk")
        imageCorrectWrongImageView.alpha = 0.0
        UIView.animate(withDuration: 0.25, animations: {
            self.imageCorrectWrongImageView.alpha = 1.0
        })
        UIView.animate(withDuration: 0.25, animations: {
            self.imageCorrectWrongImageView.alpha = 0.0
        })
    }
    
    func wrongAnimation() {
        imageCorrectWrongImageView.image = #imageLiteral(resourceName: "nukWrong")
        imageCorrectWrongImageView.alpha = 0.0
        UIView.animate(withDuration: 0.25, animations: {
            self.imageCorrectWrongImageView.alpha = 1.0
        })
        UIView.animate(withDuration: 0.25, animations: {
            self.imageCorrectWrongImageView.alpha = 0.0
        })
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
        incorrectLabel.text = "wrong: \(incorrectAnsCount)"
    }
    
    func randomIsotopeMass(_ atomicNumber: Int) -> Int {
        
        let masses = elementsRangeArray2D[atomicNumber].count - 1
        let randomMas = Int.random(in: 0...masses)
        
        return (elementsRangeArray2D[atomicNumber][randomMas])
    }
    
    
}


