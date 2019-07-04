//
//  Card.swift
//  Chemmory
//
//  Created by Grzesiek Kulesza on 01/03/2019.
//  Copyright © 2019 Grzesiek Kulesza. All rights reserved.
//

import Foundation

class Card {
    
    var isFliped = false
    var isMatched = false
    var isCardOne = true
    
    var imageBackName = ""
    var elementName: String = ""
    var elementValence: String = "" // all valence
    var elementValenceR: String = "" //rare valence
    var elementValenceC: String = "" //common valence
    var elementNumber: Int = 0
    var elementSybmol: String = ""
    var elementMass: Float = 0.0
    var elementGrup: Int = 0
    
}
