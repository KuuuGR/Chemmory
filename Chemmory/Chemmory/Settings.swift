//
//  Constants.swift
//  Chemmory
//
//  Created by Grzesiek Kulesza on 15/03/2019.
//  Copyright © 2019 Grzesiek Kulesza. All rights reserved.
//
import Foundation
import RealmSwift

let lifeBarScotchAmmount: Int = 57
var cardBackgroundIsWhite: Bool = true
var backgroundCardPictureNumber = Int.random(in: 0...117) // 0 - 117
var backgroundPictureNumber = Int.random(in: 0...22) //0 - 22
var showHintUserSelect: String = "name" //mass,valence,number,symbol

class UserSettings: Object {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var cardForegroundColorIsCustom: Bool = true
    @objc dynamic var backgroundPictureNumber: Int = 0
    @objc dynamic var gameBackgroundPictureNumber: Int = 0
    @objc dynamic var showHintUserSelect: String = ""
    @objc dynamic var  languageChosen: String = ""
    //fonts zippers:
    @objc dynamic var  cardFontsColorRed: Float = 0
    @objc dynamic var  cardFontsColorGreen: Float = 0
    @objc dynamic var  cardFontsColorBlue: Float = 0
    //zippers foreground card:
    @objc dynamic var  cardFrontColorRed: Float = 1
    @objc dynamic var  cardFrontColorGreen: Float = 1
    @objc dynamic var  cardFrontColorBlue: Float = 1
    
    override class func primaryKey() -> String? {
        return "id"
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
}

var globalSettings = UserSettings()
