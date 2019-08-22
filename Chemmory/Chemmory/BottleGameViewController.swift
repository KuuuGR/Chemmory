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
    @IBOutlet weak var centerBottleButton: UIButton!
    @IBOutlet var questButtons: [UIButton]!
    
    var rotAngle = Int.random(in: 0...7)
    var round: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareButtons()
        
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
        let rotDeg = (rotAngleCG * 360 / 2 / 3.141592653589793)
        print(rotDeg.rounded())
        print(rotAngle)
        
        switch rotAngle {
        case 0:
            print("cóś")
        case 1:
            print("north")
        case 2:
            print("south")
        default:
            print ("different")
        }
        
        
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
        
    }
    
    func prepareButtons(){
        
        for button in questButtons {
            button.backgroundColor = .clear
            button.layer.cornerRadius = 25
            button.layer.borderWidth = 3
            button.layer.borderColor = UIColor.white.cgColor
        }
    }
    
    

}
