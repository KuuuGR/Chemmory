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
var backgroundPictureNumber = Int.random(in: 0...117) // 0 - 1017
var showHintUserSelect: String = "name" //mass,valence,number,symbol
var cardFontsColor: [Float] = [0,0,0]

class UserSettings: Object {
    
    @objc dynamic var cardBackgroundIsWhite: Bool = true
    @objc dynamic var backgroundPictureNumber: Int = 0
    @objc dynamic var showHintUserSelect: String = ""
    @objc dynamic var  cardFontsColorRed: Int = 0
    @objc dynamic var  cardFontsColorGreen: Int = 0
    @objc dynamic var  cardFontsColorBlue: Int = 0
    @objc dynamic var  languageChosen: String = ""
    //@objc dynamic var cardFontsColor: [Float] = [0,0,0]
}
