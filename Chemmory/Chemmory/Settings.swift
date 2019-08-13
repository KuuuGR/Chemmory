//
//  Constants.swift
//  Chemmory
//
//  Created by Grzesiek Kulesza on 15/03/2019.
//  Copyright © 2019 Grzesiek Kulesza. All rights reserved.
//
import Foundation
import RealmSwift

let lifeBarScotchAmmount: Int = 57 //default 57
let lifeBarSpeed = 1400 // default 1000
let maxBackgroundCardPictureNumber = 211
let maxGameBackgroundPictureNumber = 35
var userDefaultName: String? 
var isWon = false

class UserGameSettings: Object {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var cardForegroundColorIsCustom: Bool = true
    @objc dynamic var backgroundCardPictureNumber: Int = 0
    @objc dynamic var gameBackgroundPictureNumber: Int = 0
    @objc dynamic var hintUserChose: String = "name" //name,mass,valence,number,symbol
    @objc dynamic var  languageChosen: String = "EN"
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
    
    func copyUserGameSetings(from: UserGameSettings, to: UserGameSettings){
        
        to.cardForegroundColorIsCustom = from.cardForegroundColorIsCustom
        to.backgroundCardPictureNumber = from.backgroundCardPictureNumber
        to.gameBackgroundPictureNumber = from.gameBackgroundPictureNumber
        to.hintUserChose = from.hintUserChose
        to.languageChosen = from.languageChosen
        to.cardFontsColorRed = from.cardFontsColorRed
        to.cardFontsColorGreen = from.cardFontsColorGreen
        to.cardFontsColorBlue = from.cardFontsColorBlue
        to.cardFrontColorRed = from.cardFrontColorRed
        to.cardFrontColorGreen = from.cardFrontColorGreen
        to.cardFrontColorBlue = from.cardFrontColorBlue
    }
}

var globalSettings = UserGameSettings()
var tempSettings = UserGameSettings()
