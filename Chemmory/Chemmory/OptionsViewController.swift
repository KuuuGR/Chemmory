//
//  OptionsViewController.swift
//  Chemmory
//
//  Created by Grzesiek Kulesza on 16/04/2019.
//  Copyright © 2019 Grzesiek Kulesza. All rights reserved.
//

import UIKit

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
        copyMySetingsTo(target: backupGlobalSettings)
        
        markCurrentSetHint()
        markActualFontColor()
        markActualFrontCardColor()
        setForegroundCardColor()
        markWhiteForegroundChecked()

        
        // Card Background Images
        backgroundOptionsCardImage.image = UIImage(named: "CardBack\(backgroundPictureNumber)")
        fontOptionsCardImage.image = backgroundOptionsCardImage.image
        
        backgroundNumber.text = String(backgroundPictureNumber)
        
        //Front card color Button round
        frontElementView.layer.cornerRadius = saveButonNo.frame.height * 0.2
        
        // Save buttons round
        saveButtonYes.layer.cornerRadius = saveButtonYes.frame.height / 2
        saveButonNo.layer.cornerRadius = saveButonNo.frame.height / 2
        
        // Hint image and view
        hintCardImage.image = backgroundOptionsCardImage.image
        hintCardView.layer.cornerRadius = saveButonNo.frame.height * 0.2
       
    }
    
    //Background Options
    
    @IBAction func dcsImageNrButtonTapped(_ sender: UIButton) {
        changeCardBackPicture(increasing: false)
    }
    
    @IBAction func incImageNrButtonTapped(_ sender: Any) {
        changeCardBackPicture(increasing: true)
    }
    
    //Fonts Options
    
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
        
        if (backgroundPictureNumber < 117), increasing  {
            backgroundPictureNumber += 1
        } else if (backgroundPictureNumber > 0 ), !increasing {
            backgroundPictureNumber -= 1
        }
        backgroundOptionsCardImage.image = UIImage(named: "CardBack\(backgroundPictureNumber)")
        backgroundNumber.text = String(backgroundPictureNumber)
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
    
    func copyMySetingsTo(target: UserSettings ){
        
        target.cardForegroundColorIsCustom = globalSettings.cardForegroundColorIsCustom
        target.backgroundPictureNumber = globalSettings.backgroundPictureNumber
        target.gameBackgroundPictureNumber = globalSettings.gameBackgroundPictureNumber
        target.showHintUserSelect = globalSettings.showHintUserSelect
        target.languageChosen = globalSettings.languageChosen
        target.cardFontsColorRed = globalSettings.cardFontsColorRed
        target.cardFontsColorGreen = globalSettings.cardFontsColorGreen
        target.cardFontsColorBlue = globalSettings.cardFontsColorBlue
        target.cardFrontColorRed = globalSettings.cardFrontColorRed
        target.cardFrontColorGreen = globalSettings.cardFrontColorGreen
        target.cardFrontColorBlue = globalSettings.cardFrontColorBlue
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


