//
//  TextTwistModel.swift
//  TextTwist
//
//  Created by C4Q  on 10/23/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

enum GuessedWord {
    case threeLetter, fourLetter, fiveLetter, sixLetter, notvalid, wrongWord
}
class TextTwistModel {
    
    var currentInfo = WordData.allInfo[Int(arc4random_uniform(3))]

    func guess(_ inputWord: String) -> GuessedWord {
        if currentInfo.words.contains(inputWord) {
            if inputWord.count == 3 {
                return .threeLetter
            }
            if inputWord.count == 4 {
                return .fourLetter
            }
            if inputWord.count == 5 {
                return .fiveLetter
            }
            if inputWord.count == 6 {
                return .sixLetter
            }
        } else {
            return .wrongWord
        }
        return .notvalid
    }
}
