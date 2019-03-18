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
//    @objc dynamic var score: Float?
}

class Result2: NSObject {
    let name: String
    let date: String
    let time: String
    let misses: Int
    let score: Float
    
    init(name: String, date: String, time: String, misses: Int, score: Float) {
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
