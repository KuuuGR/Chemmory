//
//  MainViewController.swift
//  Chemmory
//
//  Created by Grzesiek Kulesza on 27/02/2019.
//  Copyright © 2019 Grzesiek Kulesza. All rights reserved.
//

import UIKit
import RealmSwift

class MainViewController: UIViewController {
    
    var mPress: Int = 0
    var rPress: Int = 0
    var alphaStartedCard: CGFloat = 0.2
    var alphaTappedCard: CGFloat = 0.9
    var optionsButtonTapped = false
    var languageButtonTapped = false
    var CreditsButtonTapped = false
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var startGameLabel: UILabel!

    @IBOutlet weak var c_cardButton: UIButton!
    @IBOutlet weak var he_cardButton: UIButton!
    @IBOutlet weak var m_cardButton: UIButton!
    @IBOutlet weak var mo_cardButton: UIButton!
    @IBOutlet weak var r_cardButton: UIButton!
    @IBOutlet weak var y_cardButton: UIButton!
    
    @IBOutlet weak var options_cardButton: UIButton!
    @IBOutlet weak var optionsSplashImage: UIImageView!
    @IBOutlet weak var language_cardButton: UIButton!
    @IBOutlet weak var languageSplashImage: UIImageView!
    @IBOutlet weak var credits_cardButton: UIButton!
    @IBOutlet weak var creditsSplashImage: UIImageView!
    
    @IBAction func cButtonPush(_ sender: Any) {
        c_cardButton.alpha = alphaTappedCard
        c_cardButton.setImage(#imageLiteral(resourceName: "card_c"), for: .normal)
        SoundManager.playSound(.title)
    }
    
    @IBAction func heButtonPush(_ sender: Any) {
        he_cardButton.alpha = alphaTappedCard
        he_cardButton.setImage(#imageLiteral(resourceName: "card_he"), for: .normal)
        SoundManager.playSound(.title)
    }
    
    @IBAction func mButtonPush(_ sender: Any) {
        m_cardButton.alpha = alphaTappedCard
        m_cardButton.setImage(#imageLiteral(resourceName: "card_m1"), for: .normal)
        SoundManager.playSound(.title)
        mPress += 1
        if mPress > 50 {
            m_cardButton.setImage(#imageLiteral(resourceName: "card_M"), for: .normal)
        }
    }
    
    @IBAction func moButtonPush(_ sender: Any) {
        mo_cardButton.alpha = alphaTappedCard
        mo_cardButton.setImage(#imageLiteral(resourceName: "card_mo"), for: .normal)
        SoundManager.playSound(.title)
    }
    
    
    @IBAction func rButtonPush(_ sender: Any) {
        r_cardButton.alpha = alphaTappedCard
        r_cardButton.setImage(#imageLiteral(resourceName: "card_R1"), for: .normal)
        SoundManager.playSound(.title)
        rPress += 1
        if rPress > 50 {
            r_cardButton.setImage(#imageLiteral(resourceName: "card_R"), for: .normal)
        }
    }
    
    
    @IBAction func yButtonPush(_ sender: Any) {
        y_cardButton.alpha = alphaTappedCard
        y_cardButton.setImage(#imageLiteral(resourceName: "card_y"), for: .normal)
        SoundManager.playSound(.title)
    }
    
    
    @IBAction func optionsButtonPush(_ sender: Any) {
        options_cardButton.alpha = alphaTappedCard
        options_cardButton.setImage(#imageLiteral(resourceName: "card_oo"), for: .normal)
       optionsSplashImage.isHidden = false
        SoundManager.playSound(.options)
        if optionsButtonTapped {
            
            switchToViewController(identifier: "OptionsViewController", sbName: "Options")
        }
        optionsButtonTapped = true
        
    }
    
    @IBAction func languageButtonPush(_ sender: Any) {
        language_cardButton.alpha = alphaTappedCard
        language_cardButton.setImage(#imageLiteral(resourceName: "card_ol"), for: .normal)
        languageSplashImage.isHidden = false
        SoundManager.playSound(.options)
    }
    
    
    @IBAction func creditsButtonPush(_ sender: Any) {
        credits_cardButton.alpha = alphaTappedCard
        credits_cardButton.setImage(#imageLiteral(resourceName: "card_oc"), for: .normal)
        creditsSplashImage.isHidden = false
        SoundManager.playSound(.options)
    }
    
    @IBAction func startButtonPush(_ sender: Any) {
        SoundManager.playSound(.shuffle)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
   /*     // Add result to database
        let realm = try! Realm()
        try! realm.write {
            realm.add(globalSettings)
        }
        print("Realm save youre options at: ")
        print(Realm.Configuration.defaultConfiguration.fileURL as Any)
  */
        prepareButton(button: c_cardButton)
        prepareButton(button: he_cardButton)
        prepareButton(button: m_cardButton)
        prepareButton(button: mo_cardButton)
        prepareButton(button: r_cardButton)
        prepareButton(button: y_cardButton)
        prepareButton(button: options_cardButton)
        prepareButton(button: language_cardButton)
        prepareButton(button: credits_cardButton)

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
    
    override func viewWillAppear(_ animated: Bool) {
        
        // Hide Splashes
        optionsSplashImage.isHidden = true
        creditsSplashImage.isHidden = true
        languageSplashImage.isHidden = true
    }
    
    
    func prepareButton(button: UIButton) {
        button.alpha = alphaStartedCard
        button.layer.backgroundColor = UIColor.orange.cgColor
        button.layer.cornerRadius = button.bounds.size.height * 0.1
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        button.clipsToBounds = true
    }
    
    func switchToViewController(identifier: String, sbName: String? = nil) {
        var storyBoard = self.storyboard
        if let sbName = sbName {
            storyBoard = UIStoryboard(name: sbName, bundle: nil)
        }
        if let viewController = storyBoard?.instantiateViewController(withIdentifier: identifier) {
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
}

