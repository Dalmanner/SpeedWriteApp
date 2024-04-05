//
//  ViewController.swift
//  SpeedWriteApp
//
//  Created by Mac on 2024-03-28.
//
//A speed writing game! When the button is pushed, a countdown clock starts from 1 minute. Words show up in the wordToType, the user writes the word in the input textfield and the word is checked if it matches with the wordToType word. If it matches, the wordToType word is changed to a new word automatically and the input TextField is cleared. After a minute has passed, the game is over and the user is shown their score.

/*import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var timeLeftProgressBar: UIProgressView!
    @IBOutlet weak var wordToType: UILabel!
    @IBOutlet weak var restart: UINavigationItem!
    @IBOutlet weak var countDown: UILabel!
    @IBOutlet weak var word: UITextField!
    
    var player: Player?
    var playerName: String?
    var timer = Timer()
    var timeLeft = 60
    var incorrectWords = 0
    var correctWords = 0
    var words = ["hello", "world", "swift", "apple", "iphone", "ipad", "macbook", "airpods", "watch", "tv", "homepod", "imac", "macpro", "macmini", "ipod", "touch", "mini", "pro", "max", "mini", "air", "retina", "display", "keyboard", "mouse", "trackpad", "magic", "pencil", "smart", "battery", "life", "fast", "powerful", "light", "thin", "beautiful", "design", "innovative", "technology", "best", "product", "ever", "made", "by"]
    
    
    //var scoreManager = ScoreManager()
    
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
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toGameViewController", let gameVC = segue.destination as? ViewController {
            if let playerName = sender as? String {
                gameVC.playerName = playerName
            }
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
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                self.wordToType.textColor = UIColor.green
                self.wordToType.text = "Lets see how you did! :) "
            }
            
            timeLeftProgressBar.progressTintColor = UIColor.red
            timeLeftProgressBar.progress = 100.0
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                self.performSegue(withIdentifier: "showScoreSegue", sender: self)}
            
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
        
        var timer = Timer()
        
        var timeLeft = 60
        
        var incorrectWords = 0
        
        var correctWords = 0
        
        var words = ["hello", "world", "swift", "apple", "iphone", "ipad", "macbook", "airpods", "watch", "tv", "homepod", "imac", "macpro", "macmini", "ipod", "touch", "mini", "pro", "max", "mini", "air", "retina", "display", "keyboard", "mouse", "trackpad", "magic", "pencil", "smart", "battery", "life", "fast", "powerful", "light", "thin", "beautiful", "design", "innovative", "technology", "best", "product", "ever", "made", "by"]
        
        
       func viewDidLoad() {
            super.viewDidLoad()
            
            if let player = player {
                print("Spelarens namn: \(player.name), poäng: \(player.score)"
                )
            }
        }
    }
}*/

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var timeLeftProgressBar: UIProgressView!
    @IBOutlet weak var wordToType: UILabel!
    @IBOutlet weak var restart: UINavigationItem!
    @IBOutlet weak var countDown: UILabel!
    @IBOutlet weak var word: UITextField!
    
    // MARK: - Properties
    var playerName: String?
    var playerScore: Int?
    var player: Player?
    var timer = Timer()
    var timeLeft = 60
    var incorrectWords = 0
    var correctWords = 0
    var words = ["hello", "world", "swift", "apple", "iphone", "ipad", "macbook", "airpods", "watch", "tv", "homepod", "imac", "macpro", "macmini", "ipod", "touch", "mini", "pro", "max", "air", "retina", "display", "keyboard", "mouse", "trackpad", "magic", "pencil", "smart", "battery", "life", "fast", "powerful", "light", "thin", "beautiful", "design", "innovative", "technology", "best", "product", "ever", "made", "by"]
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        if let player = player {
            nameTextField.text = player.name
        }
        wordToType.textColor = UIColor.green
        wordToType.text = "Welcome ${player.name}!"
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.wordToType.text = "You have 60 seconds"
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.wordToType.text = "To type as many words as possible"
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.wordToType.text = "Tap to bring up your keyboard"
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 8.0) {
            self.wordToType.text = "Ready? Press start to begin!"
        }
    }
    
    // MARK: - Actions
    @IBAction func startButton(_ sender: UIButton) {
        startGame()
    }
    
    @IBAction func checkButton(_ sender: Any) {
        checkWord()
    }
    
    @objc func updateTimer() {
        guard timeLeft > 0 else {
            endGame()
            return
        }
        timeLeft -= 1
        countDown.text = "\(timeLeft)"
        timeLeftProgressBar.progress = Float(timeLeft) / 60.0
        timeLeftProgressBar.tintColor = timeLeft < 10 ? .red : .green
        countDown.textColor = timeLeft < 10 ? .red : .white
        
    }
    
    @IBAction func restartGame(_ sender: Any) {
        resetGame()
    }
    
    // MARK: - Game Logic
    func startGame() {
        resetGame()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        setNewWord()
    }
    
    func checkWord() {
        guard let currentWord = word.text, currentWord == wordToType.text else {
            incorrectWords += 1
            flashColor(color: .red)
            return
        }
        correctWords += 1
        flashColor(color: .green)
        setNewWord()
    }
    
    func resetGame() {
        timer.invalidate()
        timeLeft = 60
        correctWords = 0
        incorrectWords = 0
        countDown.text = "\(timeLeft)"
        word.text = ""
        wordToType.text = "Press start to begin!"
        timeLeftProgressBar.progress = 1.0
    }
    
    func endGame() {
        timer.invalidate()
        wordToType.text = "Game Over! Let's see how you did..."
        flashColor(color: .red, label: wordToType)
        // Handle transition to scoreboard:
        self.performSegue(withIdentifier: "scoreboard", sender: self)
        
    }
    
    func setNewWord() {
        wordToType.text = words.randomElement()
        word.text = ""
    }
    
    func flashColor(color: UIColor, label: UILabel? = nil) {
        let flashView = label ?? word
        UIView.animate(withDuration: 0.5) {
            flashView?.backgroundColor = color
        } completion: { _ in
            UIView.animate(withDuration: 0.5) {
                flashView?.backgroundColor = .white
            }
        }
    }
}

// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        word.text = ""
    }
}
