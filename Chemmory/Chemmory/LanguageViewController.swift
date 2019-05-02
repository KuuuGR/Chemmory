//
//  LanguageViewController.swift
//  Chemmory
//
//  Created by Grzesiek Kulesza on 30/04/2019.
//  Copyright © 2019 Grzesiek Kulesza. All rights reserved.
//

import UIKit
import RealmSwift

var languageChoosen: String = ""

class LanguageViewController: UIViewController {

    @IBOutlet var languageButtonsCollection: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // load options from database to template
        tempSettings.copyUserGameSetings(from: globalSettings, to: tempSettings)

        setFlagsButtons()
        markStartChoosenLanguage()
    
    }
   
    @IBAction func flagButtonPressed(_ sender: UIButton) {
    
        setFlagsButtons()
        sender.layer.borderWidth = 5
        sender.layer.borderColor = UIColor.green.cgColor
        
        switch sender.tag {
        case 1:
            languageChoosen = "PL"
        case 2:
            languageChoosen = "EN"
        case 3:
            languageChoosen = "RU"
        case 4:
            languageChoosen = "ES"
        case 5:
            languageChoosen = "FR"
        case 6:
            languageChoosen = "DE"
            
        default:
            return
        }
    }
    
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        
        // write only if different language choosen
        if tempSettings.languageChosen != languageChoosen {
            tempSettings.languageChosen = languageChoosen
            LocalizableHelper.language = languageChoosen
            let realm = try! Realm()
            try! realm.write {
                globalSettings.copyUserGameSetings(from: tempSettings, to: globalSettings)
                realm.add(globalSettings, update: true)
            }
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    
    deinit {
        languageButtonsCollection.removeAll()
    }
    
    func setFlagsButtons() {
        for button in languageButtonsCollection {
            button.layer.borderWidth = 3
            button.layer.borderColor = UIColor.white.cgColor
            button.layer.cornerRadius = button.bounds.size.height * 0.1
            button.clipsToBounds = true
        }
    }
    
    func returnNumberLanguage(lang: String) -> Int {
        switch lang {
        case "PL":
            return 1
        case "EN":
            return 2
        case "RU":
            return 3
        case "ES":
            return 4
        case "FR":
            return 5
        case "DE":
            return 6
        default:
            return 2
        }
    }
    
    func markStartChoosenLanguage() {
        for button in languageButtonsCollection {
            if returnNumberLanguage(lang: tempSettings.languageChosen) == button.tag {
                button.layer.borderWidth = 5
                button.layer.borderColor = UIColor.green.cgColor
            }
        }
    }
    

}
