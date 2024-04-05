//
//  ScoreManager.swift
//  SpeedWriteApp
//
//  Created by Frida on 2024-04-05.
//

import UIKit

class ScoreManager {
    private let highscoresKey = "highscores"
    var highscores = [Player]()
    private let userDefaults = UserDefaults.standard
    
    init() {
        loadHighscores()
    }
    
    func loadHighscores() {
        if let data = userDefaults.data(forKey: highscoresKey) {
            if let savedHighscores = try? PropertyListDecoder().decode([Player].self, from: data) {
                highscores = savedHighscores
                print("Highscores loaded successfully.")
            }
        }
    }
    
    func saveHighscores() {
          if let data = try? PropertyListEncoder().encode(highscores) {
              userDefaults.set(data, forKey: highscoresKey)
              print("Highscores saved successfully.")
          }
      }
    
    func addPlayer(_ player: Player) {
           highscores.append(player)
           //saveHighscores()
       }
    
  }




