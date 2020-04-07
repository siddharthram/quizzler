//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    
   
    @IBOutlet weak var opt3Button: UIButton!
    @IBOutlet weak var opt2Button: UIButton!
    @IBOutlet weak var opt1Button: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    

   
    var quizBrain = QuizBrain()
    
    var questionNumber = 0
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        //let col = sender.backgroundColor
        if quizBrain.checkAnswer(userAnswer) {
            sender.backgroundColor = UIColor.green
        }else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.advance()
        
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self,  selector:#selector(updateUI), userInfo:nil, repeats: false)
        
        //updateUI()
        
        
    }
    
    @objc  func updateUI () {
        questionLabel.text = quizBrain.getQuestionText() //[questionNumber].text
        opt1Button.backgroundColor = UIColor.clear
        opt2Button.backgroundColor = UIColor.clear
        opt3Button.backgroundColor = UIColor.clear
        
        let choices:[String] = quizBrain.getChoices()
        opt1Button.setTitle(choices[0], for: UIControl.State.normal)
        opt2Button.setTitle(choices[1], for: UIControl.State.normal)
        opt3Button.setTitle(choices[2], for: UIControl.State.normal)
        
        
        scoreLabel.text="Score: \(quizBrain.getScore())"
        
        progressBar.progress = quizBrain.getProgress()
        
        
    }
    
}

