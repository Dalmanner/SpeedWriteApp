//
//  HighScoreList.swift
//  SpeedWriteApp
//
//  Created by Frida on 2024-04-04.
//

import Foundation


class HighScoreList {
    private var players = [Player]()
    
    /*init() {
        add(player: Player(name: "Arnold"))
        add(player: Player(name: "Mimmi"))
    }*/
    
    init() {
        loadPlayers()
    }
    
    var count: Int {
        return players.count
    }
    
    func add(_ player: Player){
        players.append(player)
        players.sort{$0.score > $1.score}
        savePlayers()
    }
    
  /*  func player(index: Int) -> Player?{
        if index >= 0 && index < players.count {
            return players[index]
        }
            return nil
    }*/
    
    private func loadPlayers() {
        if let data = UserDefaults.standard.data(forKey: "highScoreList"),
                   let loadedPlayers = try? JSONDecoder().decode([Player].self, from: data) {
                    players = loadedPlayers
                }   
    }
    
    private func savePlayers() {
        if let encodedData = try? JSONEncoder().encode(players) {
            UserDefaults.standard.set(encodedData, forKey: "highScoreList")
        }
    }
    
    
}
