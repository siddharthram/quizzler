//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Siddharth Ram on 4/5/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answers: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String){
        text = q
        answers = a
        self.correctAnswer = correctAnswer
    }
}
