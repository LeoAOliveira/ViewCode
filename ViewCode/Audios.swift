//
//  Audios.swift
//  ViewCode
//
//  Created by Leonardo Oliveira on 30/03/20.
//  Copyright © 2020 Leonardo Oliveira. All rights reserved.
//

import Foundation

class Audios {
    
    var sounds: [String]
    
    init() {
        
        var sounds: [String] = []
        
        for i in 1...79 {
            sounds.append("Star Wars SoundFX_\(i)")
        }
        
        self.sounds = sounds
        
    }
}
