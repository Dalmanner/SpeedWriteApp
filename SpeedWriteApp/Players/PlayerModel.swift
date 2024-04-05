//
//  UserModel.swift
//  SpeedWriteApp
//
//  Created by Karl Nyhlin on 2024-04-03.
//

import Foundation

class Player: Codable{
    var name: String
    var score: Int
    
    init() {
        self.name = "Player"
        self.score = 0
    }
    init(name: String, score: Int = 0) {
        self.name = name
        self.score = score
    }
}
