//
//  ShowScoreTableViewCell.swift
//  SpeedWriteApp
//
//  Created by Mac on 2024-03-28.
//


//ANVÄNDS EJ!!!!

import UIKit

class ShowScoreTableViewCell: UITableViewCell {
    
    var playerName: String
    var score: Int
    //var correctWords: Int = 0
   // var incorrectWords: Int = 0
   // var totalWords: Int = 0
    
    required init?(coder aDecoder: NSCoder) {
            // Initiera egenskaperna med standardvärden för att undvika optionals
            self.playerName = ""
            self.score = 0
            super.init(coder: aDecoder)
        }
    
    
    init(playerName: String, score: Int) {
            self.playerName = playerName
            self.score = score
        super.init(style: .default, reuseIdentifier: nil)   
    }
    
    

    
    //override func awakeFromNib() {
      //  super.awakeFromNib()
        // Initialization code
  //  }

    //override func setSelected(_ selected: Bool, animated: Bool) {
    //   super.setSelected(selected, animated: animated)
        
        //update the labels for the scores: correctWords, incorrectWords, and wordsPerMinute/totalWords*60
       
        // Configure the view for the selected state
    //}
    
}
