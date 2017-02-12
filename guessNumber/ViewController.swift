//
//  ViewController.swift
//  guessNumber
//
//  Created by Lian on 2/11/17.
//  Copyright © 2017 Lian Randle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let lowerBound = 1
    let upperBound = 100
    var numberToGuess: Int!
    var numberOfGuesses = 0
    
    @IBOutlet weak var guessLabel: UILabel!
    @IBOutlet weak var guessTestField: UITextField!
    
    func validate(_ guess: Int) {
        if guess < lowerBound || guess > upperBound {
            showBoundsAlert()
        } else if guess < numberToGuess {
            guessLabel.text = "Higher! ⬆️"
        } else if guess > numberToGuess {
            guessLabel.text = "Lower! ⬇️"
        } else {
            showWinAlert()
            numberOfGuesses = 0
            generateRandomNumber()
        }
    }
    
    func showBoundsAlert() {
        let alert = UIAlertController(title: "Hey!", message: "Your guess should be between 1 and 100!", preferredStyle: .alert)
        let action = UIAlertAction(title: "Got it", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func showWinAlert() {
        guessLabel.text = "GUESS THE LABEL"
        guessTestField.text = ""
        let alert = UIAlertController(title: "Hey!", message: "You win!", preferredStyle: .alert)
        let action = UIAlertAction(title: "Play again", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
        
        
    }
    

    

    @IBAction func guessButtonPressed(_ sender: Any) {
        
        if let guess = guessTestField.text {
            if let guessInt = Int(guess) {
                numberOfGuesses = numberOfGuesses + 1
                validate(guessInt)
            }
        }
    }
    
    
    func generateRandomNumber() {
        numberToGuess = Int(arc4random_uniform(100)) + 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateRandomNumber()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

