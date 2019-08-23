//
//  SoundManager.swift
//  Chemmory
//
//  Created by Grzesiek Kulesza on 07/03/2019.
//  Copyright © 2019 Grzesiek Kulesza. All rights reserved.
//

import Foundation
import AVFoundation

class SoundManager {
    
    static var audioPlayer: AVAudioPlayer?
    
    enum SoundEffect {
        case flip
        case shuffle
        case match
        case nomatch
        case win
        case lose
        case options
        case title
        case results
        case back
        case start
        //effect for hidden game
        case middle
        case right
        case down
        case left
        case up
        case hBack
        case record
        case hPlay
        case noRep
        case wrong
        case correct
        
    }
    
    static func playSound(_ effect: SoundEffect){
        
        var soundFilename = ""
        
        // Determine witch sound effect we want to play
        // And set the appropriate filename
        
        switch effect {
        case .flip:
            soundFilename = "flip05"//"cardflip"
            
        case .shuffle:
            soundFilename = "shuffle1"
            
        case .match:
            soundFilename = "flip08"//"dingcorrect"
            
        case .nomatch:
            soundFilename = "flipBack04"//"dingwrong"
        
        case .win:
            soundFilename = "win01"
            
        case .lose:
            soundFilename = "fail01" //"lose"
        
        case .results:
            soundFilename = "boom"
            
        case .options:
            soundFilename = "plum"
            
        case .title:
            soundFilename = "puck"
            
        case .back:
            soundFilename = "spring"
            
        case .start:
            soundFilename = "start1"
            
        case .middle:
            soundFilename = "middle"
            
        case .right:
            soundFilename = "right"
            
        case .down:
            soundFilename = "down"
            
        case .left:
            soundFilename = "left"
            
        case .up:
            soundFilename = "up"
            
        case .hBack:
            soundFilename = "hBack"
            
        case .record:
            soundFilename = "record"
            
        case .hPlay:
            soundFilename = "hPlay"
            
        case .noRep:
            soundFilename = "noRep"
            
        case .correct:
            soundFilename = "correct"
            
        case .wrong:
            soundFilename = "wrong"
        
        }
        
        // Get the path to the sound file inside the bundle
        let bundlePath = Bundle.main.path(forResource: soundFilename, ofType: "wav")
        guard bundlePath != nil else {
            print ("Couldn't find sound file \(soundFilename) in teh bundle")
            return
        
        }
        
        // Create a URL object from this string path
        let soundURL = URL(fileURLWithPath: bundlePath!)
        
        do {
            //Create audio player object
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            
            //Play the sound
            audioPlayer?.play()
        }
        catch {
            // Couldn't create audio player object, log the error
            print("Couldn't create the audio player object for sound file \(soundFilename)")
        }
    }
}
