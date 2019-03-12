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
    @objc dynamic var time: String?
    @objc dynamic var misses: String?
    
}
