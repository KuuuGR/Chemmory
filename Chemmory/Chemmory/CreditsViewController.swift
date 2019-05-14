//
//  CreditsViewController.swift
//  Chemmory
//
//  Created by Grzesiek Kulesza on 06/05/2019.
//  Copyright © 2019 Grzesiek Kulesza. All rights reserved.
//

import UIKit

let durationAnimation: Double = 3.5

class CreditsViewController: UIViewController {

    @IBOutlet weak var logoButton: UIButton!
    @IBOutlet weak var upperConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logoButton.layer.cornerRadius =  logoButton.frame.height * 0.1
        logoButton.layer.borderWidth = 4
        logoButton.layer.borderColor = UIColor.darkGray.cgColor
        logoButton.clipsToBounds = true
        
        logoButton.rotate()
        UIView.animate(withDuration: durationAnimation, delay: 0, options: .curveEaseOut, animations: {
            self.upperConstraint.constant += self.view.bounds.height/5
            self.view.layoutIfNeeded()
            
        }, completion: { (true) in //self.animationLoadCycle()
            self.logoButton.stopRotating()
            })
       // upperConstraint.constant = 120.0
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func logoButtonTapped(_ sender: Any) {
        
        UIApplication.shared.openURL(URL(string: "https://www.9bits.com/")!)
    }
    
}

extension UIView {
    private static let kRotationAnimationKey = "rotationanimationkey"
    
    func rotate(duration: Double = durationAnimation/2) {
        if layer.animation(forKey: UIView.kRotationAnimationKey) == nil {
            let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
            
            rotationAnimation.fromValue = 0.0
            rotationAnimation.toValue = Float.pi * 2.0
            rotationAnimation.duration = duration
            rotationAnimation.repeatCount = Float.infinity
            
            layer.add(rotationAnimation, forKey: UIView.kRotationAnimationKey)
        }
    }
    
    func stopRotating() {
        if layer.animation(forKey: UIView.kRotationAnimationKey) != nil {
            layer.removeAnimation(forKey: UIView.kRotationAnimationKey)
        }
    }
}
