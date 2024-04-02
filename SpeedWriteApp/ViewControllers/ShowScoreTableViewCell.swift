//
//  ShowScoreTableViewCell.swift
//  SpeedWriteApp
//
//  Created by Mac on 2024-03-28.
//

import UIKit

class ShowScoreTableViewCell: UITableViewCell {
    
    var correctWords: Int = 0
    var incorrectWords: Int = 0
    var totalWords: Int = 0

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        //update the labels for the scores: correctWords, incorrectWords, and wordsPerMinute
        let correctWordsLabel = UILabel()
        correctWordsLabel.text = "Correct Words: \(correctWords)"
        let incorrectWordsLabel = UILabel()
        incorrectWordsLabel.text = "Incorrect Words: \(incorrectWords)"
        let wordsPerMinuteLabel = UILabel()
        wordsPerMinuteLabel.text = "Words Per Minute: \(totalWords / 60)"

        // Configure the view for the selected state
    }
    
}
