//
//  MainViewController.swift
//  Chemmory
//
//  Created by Grzesiek Kulesza on 27/02/2019.
//  Copyright © 2019 Grzesiek Kulesza. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var mPress: Int = 0
    var rPress: Int = 0
    var alphaCard: CGFloat = 0.9
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var startGameLabel: UILabel!

    @IBOutlet weak var c_cardButton: UIButton!
    @IBOutlet weak var he_cardButton: UIButton!
    @IBOutlet weak var m_cardButton: UIButton!
    @IBOutlet weak var mo_cardButton: UIButton!
    @IBOutlet weak var r_cardButton: UIButton!
    @IBOutlet weak var y_cardButton: UIButton!
    @IBOutlet weak var left_cardButton: UIButton!
    @IBOutlet weak var right_cardButton: UIButton!
    @IBOutlet weak var bottom_cardButton: UIButton!
    
    @IBAction func cButtonPush(_ sender: Any) {
        c_cardButton.alpha = alphaCard
        c_cardButton.setImage(#imageLiteral(resourceName: "card_c"), for: .normal)
        SoundManager.playSound(.title)
    }
    
    @IBAction func heButtonPush(_ sender: Any) {
        he_cardButton.alpha = alphaCard
        he_cardButton.setImage(#imageLiteral(resourceName: "card_he"), for: .normal)
        SoundManager.playSound(.title)
    }
    
    @IBAction func mButtonPush(_ sender: Any) {
        m_cardButton.alpha = alphaCard
        m_cardButton.setImage(#imageLiteral(resourceName: "card_m1"), for: .normal)
        SoundManager.playSound(.title)
        mPress += 1
        if mPress > 50 {
            m_cardButton.setImage(#imageLiteral(resourceName: "card_M"), for: .normal)
        
        }
    }
    
    
    @IBAction func moButtonPush(_ sender: Any) {
        mo_cardButton.alpha = alphaCard
        mo_cardButton.setImage(#imageLiteral(resourceName: "card_mo"), for: .normal)
        SoundManager.playSound(.title)
    }
    
    
    @IBAction func rButtonPush(_ sender: Any) {
        r_cardButton.alpha = alphaCard
        r_cardButton.setImage(#imageLiteral(resourceName: "card_R1"), for: .normal)
        SoundManager.playSound(.title)
        rPress += 1
        if rPress > 50 {
            r_cardButton.setImage(#imageLiteral(resourceName: "card_R"), for: .normal)
        }
    }
    
    
    
    @IBAction func yButtonPush(_ sender: Any) {
        y_cardButton.alpha = alphaCard
        y_cardButton.setImage(#imageLiteral(resourceName: "card_y"), for: .normal)
        SoundManager.playSound(.title)
    }
    
    
    @IBAction func optionsButtonPush(_ sender: Any) {
        left_cardButton.alpha = alphaCard
        left_cardButton.setImage(#imageLiteral(resourceName: "card_oo"), for: .normal)
        SoundManager.playSound(.options)
    }
    
    @IBAction func languageButtonPush(_ sender: Any) {
        right_cardButton.alpha = alphaCard
        right_cardButton.setImage(#imageLiteral(resourceName: "card_ol"), for: .normal)
        SoundManager.playSound(.options)
    }
    
    
    @IBAction func creditsButtonPush(_ sender: Any) {
        bottom_cardButton.alpha = alphaCard
        bottom_cardButton.setImage(#imageLiteral(resourceName: "card_oc"), for: .normal)
        SoundManager.playSound(.options)
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareButton(button: c_cardButton)
        prepareButton(button: he_cardButton)
        prepareButton(button: m_cardButton)
        prepareButton(button: mo_cardButton)
        prepareButton(button: r_cardButton)
        prepareButton(button: y_cardButton)
        prepareButton(button: left_cardButton)
        prepareButton(button: right_cardButton)
        prepareButton(button: bottom_cardButton)

        startButton.layer.backgroundColor = UIColor.red.cgColor
        startButton.layer.cornerRadius = 60
        
        startButton.layer.borderWidth = 8
        startButton.layer.borderColor = UIColor.white.cgColor
        startGameLabel.textColor = UIColor.yellow
    }

    override func viewDidAppear(_ animated: Bool) {
        if mPress >= 1 {
            mPress = 0
            m_cardButton.setImage(#imageLiteral(resourceName: "card_m1"), for: .normal)
        }
        if rPress >= 1 {
            rPress = 0
            r_cardButton.setImage(#imageLiteral(resourceName: "card_R1"), for: .normal)
        }
        
        super.viewDidAppear(true)
    }
    
    
    func prepareButton(button: UIButton) {
        button.layer.backgroundColor = UIColor.orange.cgColor
        button.layer.cornerRadius = button.bounds.size.height * 0.1
        button.alpha = 0.4
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        button.clipsToBounds = true
    }
    
}

