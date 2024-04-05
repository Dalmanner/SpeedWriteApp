//
//  HighScoreList.swift
//  SpeedWriteApp
//
//  Created by Frida on 2024-04-04.
//

import Foundation


class HighScoreList {
    private var players = [Player]()
    
    init() {
        add(player: Player(name: "Arnold"))
        add(player: Player(name: "Mimmi"))
    }
    
    var count: Int {
        return players.count
    }
    
    func add(player: Player){
        players.append(player)
    }
    
    func player(index: Int) -> Player?{
        if index >= 0 && index < players.count {
            return players[index]
        }
            return nil
    }
    
    
    
}
