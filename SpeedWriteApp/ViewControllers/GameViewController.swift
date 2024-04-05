//
//  ViewController.swift
//  SpeedWriteApp
//
//  Created by Mac on 2024-03-28.
//
//A speed writing game! When the button is pushed, a countdown clock starts from 1 minute. Words show up in the wordToType, the user writes the word in the input textfield and the word is checked if it matches with the wordToType word. If it matches, the wordToType word is changed to a new word automatically and the input TextField is cleared. After a minute has passed, the game is over and the user is shown their score.

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var table: UITableView!

    @IBOutlet weak var nameTextField: UITextField!
    
    var player: Player?
    
    @IBOutlet weak var timeLeftProgressBar: UIProgressView!
    
    @IBOutlet weak var wordToType: UILabel!

    @IBOutlet weak var restart: UINavigationItem!
    @IBOutlet weak var countDown: UILabel!
    @IBOutlet weak var word: UITextField!
    
    var playerName: String?
    var timer = Timer()
    var timeLeft = 60
    var incorrectWords = 0
    var correctWords = 0
    var words = ["hello", "world", "swift", "apple", "iphone", "ipad", "macbook", "airpods", "watch", "tv", "homepod", "imac", "macpro", "macmini", "ipod", "touch", "mini", "pro", "max", "mini", "air", "retina", "display", "keyboard", "mouse", "trackpad", "magic", "pencil", "smart", "battery", "life", "fast", "powerful", "light", "thin", "beautiful", "design", "innovative", "technology", "best", "product", "ever", "made", "by"]
    
    
    var scoreManager = ScoreManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        if let playerName = playerName {
            nameTextField.text = playerName
        }
    }
    
    
    @IBAction func startButton(_ sender: UIButton) {
        startGame()
    }
    
    @IBAction func checkButton(_ sender: Any) {
        checkWord()
    }
    @IBAction func writeWord(_ sender: Any) {
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            word.resignFirstResponder()
           // return true
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toGameViewController", let gameVC = segue.destination as? ViewController {
            if let playerName = sender as? String {
                gameVC.playerName = playerName
               }
           }
       }
    
    
    func startGame() {
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        wordToType.text = words.randomElement()
       
        checkWord()
        
        if timeLeft == 0 {
            timer.invalidate()
            wordToType.text = "Game Over!"
        }
    }
    
    @objc func updateTimer() {
        if timeLeft > 0 {
            timeLeft -= 1
            countDown.text = String(timeLeft)
            timeLeftProgressBar.progressTintColor = UIColor.green
            timeLeftProgressBar.progress = Float(timeLeft) / 60
            
        } else {
            
            timer.invalidate()
            countDown.textColor = UIColor.red
            wordToType.textColor = UIColor.red
            wordToType.text = "Game Over!"
          
            gameOver()
        }
    }
    
    func gameOver() {
        guard let playerName = nameTextField?.text, !playerName.isEmpty else {
            print("Player name is empty or nil")
            return
        }
        let newScore = calculateScore(correctWords: correctWords, timeLeft: timeLeft)
        let player = Player(name: playerName, score: newScore)
        scoreManager.addPlayer(player)
        scoreManager.saveHighscores()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                self.wordToType.textColor = UIColor.green
                self.wordToType.text = "Lets see how you did! :) "
            }
            
            timeLeftProgressBar.progressTintColor = UIColor.red
            timeLeftProgressBar.progress = 100.0
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                self.performSegue(withIdentifier: "showScoreSegue", sender: self)}
        }
    }
    
    @IBAction func restartGame(_ sender: Any) {
        
        timer.invalidate()
        timeLeft = 60
        correctWords = 0
        incorrectWords = 0
        wordToType.text = "Press start to begin!"
        word.text = ""
        countDown.text = "60"
        
    }
     
    
    func checkWord() {
        if word.text == wordToType.text {
          correctWords += 1
                    word.backgroundColor = UIColor.green
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.word.backgroundColor = UIColor.white
                    }
                    wordToType.text = words.randomElement()
                    word.text = ""
                } else {
                    incorrectWords += 1
                    word.backgroundColor = UIColor.red
                    //wait 1 second:
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.word.backgroundColor = UIColor.white
                    }
                }
            }
        
    
    func calculateScore(correctWords: Int, timeLeft: Int) -> Int {
           let pointsPerWord = 10
           let correctWordsScore = correctWords * pointsPerWord
           let timeScore = timeLeft
           let totalScore = correctWordsScore + timeScore
           return totalScore
       }
    
    @IBAction func restartGame(_ sender: Any) {
        
        timer.invalidate()
        timeLeft = 60
        correctWords = 0
        incorrectWords = 0
        wordToType.text = ""
        word.text = ""
        countDown.text = "60"
    }
    
    func enterPressed() -> Bool {
        if word.text == "" {
            return false
        } else {
            return true
        }
    }
    
    func startGame() {
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        wordToType.text = words.randomElement()
        
        wordsPerMinuteCalculator().self
        
        checkWord()
        
        if timeLeft == 0 {
            timer.invalidate()
            wordToType.textColor = UIColor.red
            wordToType.text = "Game Over!"
            
        } else {
            wordToType.textColor = UIColor.blue
        }
    }

    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = word.text!
        let newLength = text.count + string.count - range.length
        return newLength <= 1
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if word.text == wordToType.text {
            //change wordToType to a new word
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        word.text = ""
    }
    
    func wordsPerMinuteCalculator() {
        let totalWords = correctWords
        let wordsPerMinute = totalWords / 60
    }
    
        
        if let player = player {
            print("Spelarens namn: \(player.name), poäng: \(player.score)"
            )          
        }     
    }

}
