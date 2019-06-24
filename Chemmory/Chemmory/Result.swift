//
//  Cat.swift
//  Chemmory
//
//  Created by Grzesiek Kulesza on 12/03/2019.
//  Copyright © 2019 Grzesiek Kulesza. All rights reserved.
//

import Foundation
import RealmSwift

class Result: Object {
    
    @objc dynamic var name: String?
    @objc dynamic var date: String?
    //@objc dynamic var hint: String?
    @objc dynamic var time: Float = 999.9
    @objc dynamic var misses: Int = 999
    @objc dynamic var score: Float = 0.0
}
