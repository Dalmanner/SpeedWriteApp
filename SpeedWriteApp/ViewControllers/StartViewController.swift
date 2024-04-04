//
//  StartViewController.swift
//  SpeedWriteApp
//
//  Created by Weda on 2024-04-04.
//

import UIKit

class StartViewController: UIViewController {
    
    
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        
    }
    
    
    @IBAction func nextButtonClicked (_ sender: UIButton) {
        
        guard let playerName = nameTextField.text, !playerName.isEmpty else {
            print("Please write a name to start the game!")
            return
        }
        
        performSegue(withIdentifier: "toGameViewController", sender: playerName)
        
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toGameViewController", let gameVC = segue.destination as? ViewController {
            
            let newPlayer = Player(name: "spelarens namn")
            gameVC.player = newPlayer
           
                }
            }
        }
   // }
//}
