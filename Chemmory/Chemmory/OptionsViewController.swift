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
    @IBOutlet weak var hintCard01View: UIView!
    @IBOutlet weak var hintCard02View: UIView!
    @IBOutlet weak var hintCard03View: UIView!
    @IBOutlet weak var hintCard04View: UIView!
    
    @IBOutlet weak var saveButtonYes: UIButton!
    @IBOutlet weak var saveButonNo: UIButton!
    
    @IBOutlet var OptionsFoldViews: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // load options from database to template
        tempSettings.copyUserGameSetings(from: globalSettings, to: tempSettings)
        
        markCurrentSetHint()
        markActualFontColor()
        markActualFrontCardColor()
        setForegroundCardColor(view: frontElementView)
        markWhiteForegroundChecked()
        roundCornersOptionsFoldViews()

        // Card Background Images
        backgroundOptionsCardImage.image = UIImage(named: "CardBack\(tempSettings.backgroundCardPictureNumber)")
        fontOptionsCardImage.image = backgroundOptionsCardImage.image
        
        backgroundNumber.text = String(tempSettings.backgroundCardPictureNumber)
        
        //Front card color Button round
        frontElementView.layer.cornerRadius = saveButonNo.frame.height * 0.2
        
        //BackgroundImage
        backgroundPictureNumberLabel.text = String(tempSettings.gameBackgroundPictureNumber)
        backgroundPictureInOptions.image = UIImage(named: "BackPT\(tempSettings.gameBackgroundPictureNumber)")
        
        // Save buttons round
        saveButtonYes.layer.cornerRadius = saveButtonYes.frame.height / 2
        saveButonNo.layer.cornerRadius = saveButonNo.frame.height / 2
        
        // Hint image and view
        hintCardImage.image = backgroundOptionsCardImage.image
        hintCardView.layer.cornerRadius = saveButonNo.frame.height * 0.2
       
    }
    
    deinit {
        fontOptionsLabelsCollection.removeAll()
        frontCardLabelsOnElement.removeAll()
        hintButtonsOnElement.removeAll()
        OptionsFoldViews.removeAll()
        
    }
    
    //MARK: - Background Options
    
    @IBAction func dcsImageNrButtonTapped(_ sender: UIButton) {
        changeCardBackPicture(increasing: false)
    }
    
    @IBAction func incImageNrButtonTapped(_ sender: Any) {
        changeCardBackPicture(increasing: true)
    }
    
    //MARK: - Fonts color Options
    
    @IBAction func fontRZipperAction(_ sender: Any) {
        tempSettings.cardFontsColorRed = fontRZipper.value
        setFontsColor()
    }
    @IBAction func fontGZipperAction(_ sender: Any) {
        tempSettings.cardFontsColorGreen = fontGZipper.value
        setFontsColor()
    }
    
    @IBAction func fontBZipperAction(_ sender: Any) {
        tempSettings.cardFontsColorBlue = fontBZipper.value
        setFontsColor()
    }
    
    //MARK: - Front Card Color Options
    
    @IBAction func frontCardRZipperAction(_ sender: Any) {
        tempSettings.cardFrontColorRed = frontCardRZipper.value
        setForegroundCardColor(view: frontElementView)
        setHintCardColors()
    }
    
    @IBAction func frontCardGZipperAction(_ sender: Any) {
        tempSettings.cardFrontColorGreen = frontCardGZipper.value
        setForegroundCardColor(view: frontElementView)
        setHintCardColors()
    }
    
    @IBAction func frontCardBZipperAction(_ sender: Any) {
        tempSettings.cardFrontColorBlue = frontCardBZipper.value
        setForegroundCardColor(view: frontElementView)
        setHintCardColors()
    }
    
    //MARK: - Game Bcakground
    
    @IBAction func changeBackgroundButtonPush(_ sender: UIButton) {
        if (sender.tag == 1), (tempSettings.gameBackgroundPictureNumber > 0) {
            tempSettings.gameBackgroundPictureNumber -= 1
        } else if (sender.tag == 2), (tempSettings.gameBackgroundPictureNumber < maxGameBackgroundPictureNumber) {
            tempSettings.gameBackgroundPictureNumber += 1
        }
        backgroundPictureNumberLabel.text = String(tempSettings.gameBackgroundPictureNumber)
        backgroundPictureInOptions.image = UIImage(named: "BackPT\(tempSettings.gameBackgroundPictureNumber)")
    }
    
    //MARK: - Hint Options
    
    @IBAction func hintOnElementButtonPressed(_ sender: UIButton) {
        
        for button in hintButtonsOnElement {
            button.alpha = 0.2
        }
        
        switch sender.tag {
        case 1:
            for button in hintButtonsOnElement {
                if button.tag == 1 {
                   button.alpha = 1.0
                    tempSettings.hintUserChose = "number"
                }
            }
        case 2:
            for button in hintButtonsOnElement {
                if button.tag == 2 {
                    button.alpha = 1.0
                    tempSettings.hintUserChose = "valence"
                }
            }
        case 3:
            for button in hintButtonsOnElement {
                if button.tag == 3 {
                    button.alpha = 1.0
                    tempSettings.hintUserChose = "name"
                }
            }
        case 4:
            for button in hintButtonsOnElement {
                if button.tag == 4 {
                    button.alpha = 1.0
                    tempSettings.hintUserChose = "mass"
                }
            }
        default:
            for button in hintButtonsOnElement {
                button.alpha = 0.2
                tempSettings.hintUserChose = "symbol"
            }
        }
    }
    
    
    @IBAction func hintForegroundButtonPressed(_ sender: Any) {
        tempSettings.cardForegroundColorIsCustom  = !tempSettings.cardForegroundColorIsCustom
        markWhiteForegroundChecked()
    }
    
    //MARK: - SAVE OPTIONS
    
    @IBAction func saveAndQuit(_ sender: Any) {
        
        let realm = try! Realm()
        try! realm.write {
            globalSettings.copyUserGameSetings(from: tempSettings, to: globalSettings)
            realm.add(globalSettings, update: .modified)
        }
        //back to main view
        self.navigationController?.popViewController(animated: true)

         }

    
    @IBAction func cancelSaveAndQuit(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func changeCardBackPicture(increasing: Bool) {
        
        if (tempSettings.backgroundCardPictureNumber < maxBackgroundCardPictureNumber), increasing  {
            tempSettings.backgroundCardPictureNumber += 1
        } else if (tempSettings.backgroundCardPictureNumber > 0 ), !increasing {
            tempSettings.backgroundCardPictureNumber -= 1
        }
        backgroundOptionsCardImage.image = UIImage(named: "CardBack\(tempSettings.backgroundCardPictureNumber)")
        backgroundNumber.text = String(tempSettings.backgroundCardPictureNumber)
        fontOptionsCardImage.image = backgroundOptionsCardImage.image
        hintCardImage.image = backgroundOptionsCardImage.image
    }

    func setFontsColor(){
        for label in fontOptionsLabelsCollection {
            label.textColor = UIColor(red: CGFloat(tempSettings.cardFontsColorRed), green: CGFloat(tempSettings.cardFontsColorGreen), blue: CGFloat(tempSettings.cardFontsColorBlue), alpha: 1.0)
        }
        for label in frontCardLabelsOnElement {
            label.textColor = UIColor(red: CGFloat(tempSettings.cardFontsColorRed), green: CGFloat(tempSettings.cardFontsColorGreen), blue: CGFloat(tempSettings.cardFontsColorBlue), alpha: 1.0)
        }
    }
    
    func setForegroundCardColor(view: UIView) {
        view.backgroundColor = UIColor(red: CGFloat(tempSettings.cardFrontColorRed), green: CGFloat(tempSettings.cardFrontColorGreen), blue: CGFloat(tempSettings.cardFrontColorBlue), alpha: 1.0)
    }
    
    //MARK: - ZIPPERS
    //font Zipper
      func markActualFontColor(){
        
        fontRZipper.value = tempSettings.cardFontsColorRed
        fontGZipper.value = tempSettings.cardFontsColorGreen
        fontBZipper.value = tempSettings.cardFontsColorBlue
        
        setFontsColor()
    }
    
    //front card color Zippers
    func markActualFrontCardColor(){

        frontCardRZipper.value = tempSettings.cardFrontColorRed
        frontCardGZipper.value = tempSettings.cardFrontColorGreen
        frontCardBZipper.value = tempSettings.cardFrontColorBlue
        setForegroundCardColor(view: frontElementView)
        if tempSettings.cardForegroundColorIsCustom == true {
            setForegroundCardColor(view: hintCard01View)
            setForegroundCardColor(view: hintCard02View)
            setForegroundCardColor(view: hintCard03View)
            setForegroundCardColor(view: hintCard04View)
        }
    }
    
    //MARK: - Hints
    func markCurrentSetHint(){
        for button in hintButtonsOnElement {
            switch button.tag {
            case 0:
                if tempSettings.hintUserChose == "symbol" {
                button.alpha = 1
                }
            case 1:
                if tempSettings.hintUserChose == "number" {
                button.alpha = 1
                }
            case 2:
                if tempSettings.hintUserChose == "valence" {
                button.alpha = 1
                }
            case 3:
                if tempSettings.hintUserChose == "name" {
                button.alpha = 1
                }
            case 4:
                if tempSettings.hintUserChose == "mass" {
                button.alpha = 1
                }
            default:
                return
            }
        }
    }
    
    func markWhiteForegroundChecked(){
        if tempSettings.cardForegroundColorIsCustom == false {
            hintForegroundButton.setImage(#imageLiteral(resourceName: "CheckmarkSymbolUncheckedWhite"), for: .normal)
            hintCardView.backgroundColor = UIColor.chMetaloids
            hintCard01View.backgroundColor = UIColor.chNobelGasses
            hintCard02View.backgroundColor = UIColor.chOtherNonMetals
            hintCard03View.backgroundColor = UIColor.chTransitionMetals
            hintCard04View.backgroundColor = UIColor.chHydrogen
            
        } else {
            hintForegroundButton.setImage(#imageLiteral(resourceName: "CheckmarkSymbolCheckedWhite"), for: .normal)
            hintCardView.backgroundColor = UIColor.white
            //setForegroundCardColor(view: hintCardView)
            setForegroundCardColor(view: hintCard01View)
            setForegroundCardColor(view: hintCard02View)
            setForegroundCardColor(view: hintCard03View)
            setForegroundCardColor(view: hintCard04View)
        }
        
    }
    
    func roundCornersOptionsFoldViews(){
        for fold in OptionsFoldViews {
            fold.layer.cornerRadius = 10
        }
    }
    
    func setHintCardColors() {
        if
            tempSettings.cardForegroundColorIsCustom == true
        {
            setForegroundCardColor(view: hintCard01View)
            setForegroundCardColor(view: hintCard02View)
            setForegroundCardColor(view: hintCard03View)
            setForegroundCardColor(view: hintCard04View)
        }
    }
    

} // MARK: - End of class
