//
//  ViewController.swift
//  TextTwist
//
//  Created by C4Q  on 10/23/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var guessTextField: UITextField!
    @IBOutlet weak var messageToUser: UILabel!
    @IBOutlet weak var threeLetterWords: UITextView!
    @IBOutlet weak var fourLetterWords: UITextView!
    @IBOutlet weak var fiveLetterWords: UITextView!
    @IBOutlet weak var sixLetterWords: UITextView!
    @IBOutlet weak var letterBank: UILabel!
    var model = TextTwistModel()
    
    override func viewDidLoad() {
        letterBank.text = model.currentInfo.letters
        super.viewDidLoad()
        self.guessTextField.delegate = self
    }

    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if model.currentInfo.letters.contains(string) {
            return true
        }
        print("Should change")
        return false
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("Should clear")
        return true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Should return")
        textField.resignFirstResponder()
        guard let text = guessTextField.text else {
            return false
        }
        switch model.guess(text) {
        case .threeLetter:
            messageToUser.text = "Correct!"
            threeLetterWords.text.append(text)
        case .fourLetter:
            messageToUser.text = "Correct!"
            fourLetterWords.text.append(text)
        case .fiveLetter:
            messageToUser.text = "Correct!"
            fiveLetterWords.text.append(text)
        case .sixLetter:
            messageToUser.text = "Correct!"
            sixLetterWords.text.append(text)
        case .notvalid:
            messageToUser.text = "Input 3, 4, 5 or 6 letters only!"
        case .wrongWord:
            messageToUser.text = "Wrong Word!"
        }
        return true
    }
    
    
    
    
    
}

