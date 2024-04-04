//
//  UserModel.swift
//  SpeedWriteApp
//
//  Created by Karl Nyhlin on 2024-04-03.
//

import Foundation

class Player {
    var name: String
    var score: Int
    
    init() {
        self.name = "Player"
        self.score = 0
    }
    init(name: String) {
        self.name = name
        self.score = 0
    }
}
