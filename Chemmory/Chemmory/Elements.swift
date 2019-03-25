//
//  Elements.swift
//  Chemmory
//
//  Created by Grzesiek Kulesza on 25/03/2019.
//  Copyright © 2019 Grzesiek Kulesza. All rights reserved.
//

import Foundation
import RealmSwift

class Element: Object {
    
    @objc dynamic var name: String?  //Element name
    @objc dynamic var symbol: String?
    @objc dynamic var atomicNumber: Int = 0
    @objc dynamic var valence: String = ""
    @objc dynamic var valenceCommon: String = ""
    @objc dynamic var valenceRare: String = ""
    @objc dynamic var atomicMass: Float = 0.0
    @objc dynamic var group: Int = 0
}


