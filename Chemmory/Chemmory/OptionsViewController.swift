//
//  OptionsViewController.swift
//  Chemmory
//
//  Created by Grzesiek Kulesza on 16/04/2019.
//  Copyright © 2019 Grzesiek Kulesza. All rights reserved.
//

import UIKit
import RealmSwift

class OptionsViewController: UIViewController {

    @IBOutlet weak var backgroundNumber: UILabel!
    @IBOutlet weak var backgroundOptionsCardImage: UIImageView!
    
    @IBOutlet weak var fontOptionsCardImage: UIImageView!
    @IBOutlet var fontOptionsLabelsCollection: [UILabel]!
    @IBOutlet weak var fontRZipper: UISlider!
    @IBOutlet weak var fontGZipper: UISlider!
    @IBOutlet weak var fontBZipper: UISlider!
    
    @IBOutlet var frontCardLabelsOnElement: [UILabel]!
    @IBOutlet weak var frontElementView: UIView!
    @IBOutlet weak var frontCardRZipper: UISlider!
    @IBOutlet weak var frontCardGZipper: UISlider!
    @IBOutlet weak var frontCardBZipper: UISlider!
    
    @IBOutlet weak var backgroundPictureInOptions: UIImageView!
    @IBOutlet weak var backgroundPictureNumberLabel: UILabel!
    
    @IBOutlet weak var hintCardImage: UIImageView!
    @IBOutlet weak var hintCardView: UIView!
    @IBOutlet weak var hintForegroundButton: UIButton!
    @IBOutlet var hintButtonsOnElement: [UIButton]!
    
    @IBOutlet weak var saveButtonYes: UIButton!
    @IBOutlet weak var saveButonNo: UIButton!
    
    let backupGlobalSettings = UserSettings()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         // backup copy of setings
       globalSettings.copyMySetingsTo(target: backupGlobalSettings)
        
        // save options to database
/*
            let realm = try! Realm()
        
        func objectExists(id: Int) -> Bool {
            return realm.object(ofType: UserSettings.self, forPrimaryKey: id) != nil
        }
        if objectExists(id: 0) {
            print("baza danych już istnieje")
            try! realm.write {
                realm.add(globalSettings, update: true)
            }
            
        } else if objectExists(id: 0) == false {
            print("zakładam bazę danych")
            try! realm.write {
                realm.add(globalSettings)
            }
        }
*/
        
        markCurrentSetHint()
        markActualFontColor()
        markActualFrontCardColor()
        setForegroundCardColor()
        markWhiteForegroundChecked()

        
        // Card Background Images
        backgroundOptionsCardImage.image = UIImage(named: "CardBack\(backgroundCardPictureNumber)")
        fontOptionsCardImage.image = backgroundOptionsCardImage.image
        
        backgroundNumber.text = String(backgroundCardPictureNumber)
        
        //Front card color Button round
        frontElementView.layer.cornerRadius = saveButonNo.frame.height * 0.2
        
        //BackgroundImage
        backgroundPictureNumberLabel.text = String(backgroundPictureNumber)
        backgroundPictureInOptions.image = UIImage(named: "BackPT\(backgroundPictureNumber)")
        
        // Save buttons round
        saveButtonYes.layer.cornerRadius = saveButtonYes.frame.height / 2
        saveButonNo.layer.cornerRadius = saveButonNo.frame.height / 2
        
        // Hint image and view
        hintCardImage.image = backgroundOptionsCardImage.image
        hintCardView.layer.cornerRadius = saveButonNo.frame.height * 0.2
       
    }
    
    //Card background Options
    
    @IBAction func dcsImageNrButtonTapped(_ sender: UIButton) {
        changeCardBackPicture(increasing: false)
    }
    
    @IBAction func incImageNrButtonTapped(_ sender: Any) {
        changeCardBackPicture(increasing: true)
    }
    
    //Fonts color Options
    
    @IBAction func fontRZipperAction(_ sender: Any) {
        setFontsColor()
        globalSettings.cardFontsColorRed = fontRZipper.value
    }
    @IBAction func fontGZipperAction(_ sender: Any) {
        setFontsColor()
        globalSettings.cardFontsColorGreen = fontGZipper.value
    }
    
    @IBAction func fontBZipperAction(_ sender: Any) {
        setFontsColor()
        globalSettings.cardFontsColorBlue = fontBZipper.value
    }
    
    //Front Card Color Options
    
    @IBAction func frontCardRZipperAction(_ sender: Any) {
        setForegroundCardColor()
        globalSettings.cardFrontColorRed = frontCardRZipper.value
    }
    
    @IBAction func frontCardGZipperAction(_ sender: Any) {
        setForegroundCardColor()
        globalSettings.cardFrontColorGreen = frontCardGZipper.value
    }
    
    @IBAction func frontCardBZipperAction(_ sender: Any) {
        setForegroundCardColor()
        globalSettings.cardFrontColorBlue = frontCardBZipper.value
    }
    
    // Game Bcakground
    
    @IBAction func changeBackgroundButtonPush(_ sender: UIButton) {
        if (sender.tag == 1), (backgroundPictureNumber > 0) {
            backgroundPictureNumber -= 1
        } else if (sender.tag == 2), (backgroundPictureNumber < 22) {
            backgroundPictureNumber += 1
        }
        backgroundPictureNumberLabel.text = String(backgroundPictureNumber)
        backgroundPictureInOptions.image = UIImage(named: "BackPT\(backgroundPictureNumber)")
    }
    
    
    //Hint Options
    
    
    @IBAction func hintOnElementButtonPressed(_ sender: UIButton) {
        
        for button in hintButtonsOnElement {
            button.alpha = 0.2
        }
        
        switch sender.tag {
        case 1:
            for button in hintButtonsOnElement {
                if button.tag == 1 {
                   button.alpha = 1.0
                    showHintUserSelect = "number"
                }
            }
        case 2:
            for button in hintButtonsOnElement {
                if button.tag == 2 {
                    button.alpha = 1.0
                    showHintUserSelect = "valence"
                }
            }
        case 3:
            for button in hintButtonsOnElement {
                if button.tag == 3 {
                    button.alpha = 1.0
                    showHintUserSelect = "name"
                }
            }
        case 4:
            for button in hintButtonsOnElement {
                if button.tag == 4 {
                    button.alpha = 1.0
                    showHintUserSelect = "mass"
                }
            }
        default:
            for button in hintButtonsOnElement {
                button.alpha = 0.2
                showHintUserSelect = "symbol"
            }
        }
    }
    
    
    @IBAction func hintForegroundButtonPressed(_ sender: Any) {
        cardBackgroundIsWhite = !cardBackgroundIsWhite
        markWhiteForegroundChecked()
        
    }
    
    
    //Save Options
    
    @IBAction func saveAndQuit(_ sender: Any) {
    
        //update settings database

        let realm = try! Realm()
        try! realm.write {
            realm.add(globalSettings, update: true)
        }

        //back to main view
        self.navigationController?.popViewController(animated: true)

         }

    
    @IBAction func cancelSaveAndQuit(_ sender: UIButton) {
        
//         cardBackgroundIsWhite = backup_cardBackgroundIsWhite
//         backgroundPictureNumber = backup_backgroundPictureNumber
//         showHintUserSelect = backup_showHintUserSelect
//         cardFontsColor = backup_cardFontsColor
        globalSettings = backupGlobalSettings
    
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    func changeCardBackPicture(increasing: Bool) {
        
        if (backgroundCardPictureNumber < 117), increasing  {
            backgroundCardPictureNumber += 1
        } else if (backgroundCardPictureNumber > 0 ), !increasing {
            backgroundCardPictureNumber -= 1
        }
        backgroundOptionsCardImage.image = UIImage(named: "CardBack\(backgroundCardPictureNumber)")
        backgroundNumber.text = String(backgroundCardPictureNumber)
        fontOptionsCardImage.image = backgroundOptionsCardImage.image
        hintCardImage.image = backgroundOptionsCardImage.image
    }

    func setFontsColor(){
        for label in fontOptionsLabelsCollection {
            label.textColor = UIColor(red: CGFloat(globalSettings.cardFontsColorRed), green: CGFloat(globalSettings.cardFontsColorGreen), blue: CGFloat(globalSettings.cardFontsColorBlue), alpha: 1.0)
        }
        for label in frontCardLabelsOnElement {
            label.textColor = UIColor(red: CGFloat(globalSettings.cardFontsColorRed), green: CGFloat(globalSettings.cardFontsColorGreen), blue: CGFloat(globalSettings.cardFontsColorBlue), alpha: 1.0)
        }
    }
    
    func setForegroundCardColor() {
        frontElementView.backgroundColor = UIColor(red: CGFloat(globalSettings.cardFrontColorRed), green: CGFloat(globalSettings.cardFrontColorGreen), blue: CGFloat(globalSettings.cardFrontColorBlue), alpha: 1.0)
    }
    
    //font Zipper
    
      func markActualFontColor(){
        
        fontRZipper.value = globalSettings.cardFontsColorRed
        fontGZipper.value = globalSettings.cardFontsColorGreen
        fontBZipper.value = globalSettings.cardFontsColorBlue
        
        setFontsColor()
    }
    
    //front card color Zippers
    
    func markActualFrontCardColor(){

        frontCardRZipper.value = globalSettings.cardFrontColorRed
        frontCardGZipper.value = globalSettings.cardFrontColorGreen
        frontCardBZipper.value = globalSettings.cardFrontColorBlue
    
        setForegroundCardColor()
    }
    
    
    func markCurrentSetHint(){
        for button in hintButtonsOnElement {
            switch button.tag {
            case 0:
                if showHintUserSelect == "symbol" {
                button.alpha = 1
                }
            case 1:
                if showHintUserSelect == "number" {
                button.alpha = 1
                }
            case 2:
                if showHintUserSelect == "valence" {
                button.alpha = 1
                }
            case 3:
                if showHintUserSelect == "name" {
                button.alpha = 1
                }
            case 4:
                if showHintUserSelect == "mass" {
                button.alpha = 1
                }
            default:
                return
            }
        }
    }
    
    func markWhiteForegroundChecked(){
        if cardBackgroundIsWhite == false {
            hintForegroundButton.setImage(#imageLiteral(resourceName: "CheckmarkSymbolUncheckedWhite"), for: .normal)
            hintCardView.backgroundColor = UIColor.chMetaloids
        } else {
            hintForegroundButton.setImage(#imageLiteral(resourceName: "CheckmarkSymbolCheckedWhite"), for: .normal)
            hintCardView.backgroundColor = UIColor.white
        }
        
    }
    

    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


