//
//  ViewController.swift
//  Guessing Game iOS
//
//  Created by Devin Cook on 3/12/18.
//  Copyright © 2018 Devin Cook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userGuessField: UITextField!
    @IBOutlet weak var userFeedbackLabel: UILabel!
    @IBOutlet weak var rulesLabel: UILabel!
    @IBOutlet weak var buttonLabel: UIButton!
    
    var randomNumber = Int(arc4random_uniform(100))
    var tries = 5
    var rulesLabelText = """
    ********RULES********
    Rule 1. Guess a number between 1 and 100
    Rule 2. You have 5 tries to guess the number
    Rule 3. You will be given hints
"""


    
    func checkGuess(){
            var correct = false
            var guess = Int(userGuessField.text!)
        if tries != 0 && correct == false {
            if guess! > randomNumber {
                userFeedbackLabel.text = "Too high, guess again."
                tries -= 1
            }
            if guess! < randomNumber {
                userFeedbackLabel.text = "Too low, guess again."
                tries -= 1
            }
            if guess! == randomNumber {
                userFeedbackLabel.text = "CORRECT"
                correct = true
            }
            if tries == 0 {
                userFeedbackLabel.text = "GAME OVER DUDE"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        rulesLabel.text = rulesLabelText
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    
    @IBAction func guessButtonPressed(_ sender: Any) {
        //Change the feedback label if the guess is too high, too low, or equal to randomNumber
        checkGuess()
        if correct == true {
            buttonLabel. = "Play again?"
            correct = false
        }
    }
    
}

