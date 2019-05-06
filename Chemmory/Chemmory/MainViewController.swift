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
    
    var cPress: Int = 0
    var hePress: Int = 0
    var mPress: Int = 0
    var moPress: Int = 0
    var rPress: Int = 0
    var yPress: Int = 0
    
    var alphaStartedCard: CGFloat = 0.4
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
        cPress += 1
        if cPress > 5 {
            c_cardButton.setImage(#imageLiteral(resourceName: "card_c_color"), for: .normal)
        }
    }
    
    @IBAction func heButtonPush(_ sender: Any) {
        he_cardButton.alpha = alphaTappedCard
        he_cardButton.setImage(#imageLiteral(resourceName: "card_he"), for: .normal)
        SoundManager.playSound(.title)
        hePress += 1
        if hePress > 5 {
            he_cardButton.setImage(#imageLiteral(resourceName: "card_he_color"), for: .normal)
        }
    }
    
    @IBAction func mButtonPush(_ sender: Any) {
        m_cardButton.alpha = alphaTappedCard
        m_cardButton.setImage(#imageLiteral(resourceName: "card_m1"), for: .normal)
        SoundManager.playSound(.title)
        mPress += 1
        if mPress > 50 {
            m_cardButton.setImage(#imageLiteral(resourceName: "card_m1_color"), for: .normal)
        }
    }
    
    @IBAction func moButtonPush(_ sender: Any) {
        mo_cardButton.alpha = alphaTappedCard
        mo_cardButton.setImage(#imageLiteral(resourceName: "card_mo"), for: .normal)
        SoundManager.playSound(.title)
        moPress += 1
        if moPress > 5 {
            mo_cardButton.setImage(#imageLiteral(resourceName: "card_mo_color"), for: .normal)
        }
    }
    
    
    @IBAction func rButtonPush(_ sender: Any) {
        r_cardButton.alpha = alphaTappedCard
        r_cardButton.setImage(#imageLiteral(resourceName: "card_r1"), for: .normal)
        SoundManager.playSound(.title)
        rPress += 1
        if rPress > 50 {
            r_cardButton.setImage(#imageLiteral(resourceName: "card_r1_color"), for: .normal)
        }
    }
    
    
    @IBAction func yButtonPush(_ sender: Any) {
        y_cardButton.alpha = alphaTappedCard
        y_cardButton.setImage(#imageLiteral(resourceName: "card_y"), for: .normal)
        SoundManager.playSound(.title)
        yPress += 1
        if yPress > 5 {
            y_cardButton.setImage(#imageLiteral(resourceName: "card_y_color"), for: .normal)
        }
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
        if languageButtonTapped {
            
        switchToViewController(identifier: "LanguageViewController", sbName: "Language")
        }
        languageButtonTapped = true
    }
    
    
    @IBAction func creditsButtonPush(_ sender: Any) {
        credits_cardButton.alpha = alphaTappedCard
        credits_cardButton.setImage(#imageLiteral(resourceName: "card_oc"), for: .normal)
        creditsSplashImage.isHidden = false
        SoundManager.playSound(.options)
        
        if CreditsButtonTapped {
            
            switchToViewController(identifier: "CreditsViewController", sbName: "Credits")
        }
        CreditsButtonTapped = true
    }
    
    
    @IBAction func startButtonPush(_ sender: Any) {
        SoundManager.playSound(.shuffle)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TODO: make languages set by choosen
        for i in 0...112 {
         print("\"\(elements[i].name)\",")
            
        }
        
        setBackgroundCardsImages(bcgImage: #imageLiteral(resourceName: "CurieBack"))
        
        // Check is options database exist
        let realm = try! Realm()
        
        func objectExists(id: Int) -> Bool {
            return realm.object(ofType: UserGameSettings.self, forPrimaryKey: id) != nil
        }
        if objectExists(id: 0) == true {
        //Set options from Database
            
            loadSettings()
            
        } else if objectExists(id: 0) == false {
            print("zakładam bazę danych")
            try! realm.write {
                realm.add(globalSettings,update: false)
            }
            
            loadSettings()
            print("opcje podstwowe załadowane")
            
        }

        print("Realm save youre options at: ")
        print(Realm.Configuration.defaultConfiguration.fileURL as Any)

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
            r_cardButton.setImage(#imageLiteral(resourceName: "card_r1"), for: .normal)
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
        button.layer.backgroundColor = UIColor.white.cgColor
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
    
    func loadSettings() {
        
        let realm = try! Realm()
        let grabOptions = realm.objects(UserGameSettings.self)
        globalSettings = grabOptions[0]
        LocalizableHelper.language = globalSettings.languageChosen
    }
    
    func setBackgroundCardsImages(bcgImage: UIImage){
        c_cardButton.setImage(bcgImage, for: .normal)
        he_cardButton.setImage(bcgImage, for: .normal)
        m_cardButton.setImage(bcgImage, for: .normal)
        mo_cardButton.setImage(bcgImage, for: .normal)
        r_cardButton.setImage(bcgImage, for: .normal)
        y_cardButton.setImage(bcgImage, for: .normal)
        options_cardButton.setImage(bcgImage, for: .normal)
        language_cardButton.setImage(bcgImage, for: .normal)
        credits_cardButton.setImage(bcgImage, for: .normal)
    }
    
    
}

