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
    

    var player: Player?
    
    @IBOutlet weak var wordToType: UILabel!
    @IBOutlet weak var restart: UINavigationItem!
    @IBOutlet weak var countDown: UILabel!
    @IBOutlet weak var word: UITextField!
    
    @IBAction func checkButton(_ sender: Any) {
        checkWord()
    }
    @IBAction func writeWord(_ sender: Any) {
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            word.resignFirstResponder()
            return true
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
    
    
    
    @objc func updateTimer() {
        if timeLeft > 0 {
            timeLeft -= 1
            countDown.text = String(timeLeft)
        } else {
            timer.invalidate()
            wordToType.text = "Game Over!"
        }
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
    
    func checkWord() {
        if word.text == wordToType.text {
            correctWords += 1
            wordToType.text = words.randomElement()
            word.text = ""
        } else {
            incorrectWords += 1
            //printContent("Incorrect!")
            
        }
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
        
        //if enterpressed, check if word is correct
        /*if enterPressed() {
         checkWord()
         }*/
        
        checkWord()
        
        if timeLeft == 0 {
            timer.invalidate()
            wordToType.text = "Game Over!"
        }
    }
    
    var timer = Timer()
    
    var timeLeft = 60
    
    var incorrectWords = 0
    
    var correctWords = 0
    
    var words = ["hello", "world", "swift", "apple", "iphone", "ipad", "macbook", "airpods", "watch", "tv", "homepod", "imac", "macpro", "macmini", "ipod", "touch", "mini", "pro", "max", "mini", "air", "retina", "display", "keyboard", "mouse", "trackpad", "magic", "pencil", "smart", "battery", "life", "fast", "powerful", "light", "thin", "beautiful", "design", "innovative", "technology", "best", "product", "ever", "made", "by"]
    
    
    @IBAction func startButton(_ sender: UIButton) {
        startGame()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        if let player = player {
            print("Spelarens namn: \(player.name), poäng: \(player.score)"
            )
            
        }
        
        
    }
    
}
