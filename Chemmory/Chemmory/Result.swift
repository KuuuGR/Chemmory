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
    @objc dynamic var time: Float = 999.9
    @objc dynamic var misses: Int = 999
    @objc dynamic var score: Float = 0.0
//    @objc dynamic var score: Float?
}

class Result2: NSObject {
    var name: String
    var date: String
    var time: String
    var misses: Float
    var score: Float
    
    init(name: String, date: String, time: String, misses: Float, score: Float) {
        self.name = name
        self.date = date
        self.time = time
        self.misses = misses
        self.score = score
        
    }
    
    @objc dynamic var setOfResults: Result2?
    
}




/* From Stack Overflow

class Time: NSObject {
    let hours: Int
    let minutes: Int
    let seconds: Int
    
    init(hours: Int, minutes: Int, seconds: Int) {
        self.hours = hours
        self.minutes = minutes
        self.seconds = seconds
    }
}

@objc open var remainingTime: Time?

 */
