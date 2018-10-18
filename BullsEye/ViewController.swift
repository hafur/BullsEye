//
//  ViewController.swift
//  BullsEye
//
//  Created by Kevin on 18/10/2018.
//  Copyright © 2018 Kevin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentValue = 0
    var targetValue = 0
    var hitMessage = ""
    var difference = 0
    var score = 0
    var round = 1
    var totalScore = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
        updateLabel()
    }

    
    
    @IBAction func HitMeButton(_ sender: UIButton) {
        testValue()
        let alert = UIAlertController(title: "Bulls Eye", message: hitMessage, preferredStyle: .alert);
        let action = UIAlertAction(title: "Again", style: .default, handler: {
            action in
            self.startNewRound()
            self.updateLabel()
        })
        alert.addAction(action);
        present(alert, animated: true, completion: nil);
     
    }
    
    
    @IBAction func StartOverButton(_ sender: UIButton) {
        totalScore = 0
        round = 1
        updateLabel()
        startNewRound()
    }
    

    @IBAction func sliderMoved(_ slider: UISlider) {
        print("\(slider.value)   \(targetValue)")
    }
    

    func startNewRound() {
        currentValue = Int(slider.value)
        targetValue = Int.random(in: 1...100)
    }
 

    func updateLabel() {
        targetLabel.text = String(targetValue)
        roundLabel.text = String(round)
        scoreLabel.text = String(totalScore)
        round += 1
    }
    
    
    func testValue() {
        score = 100 - (abs(targetValue - Int(slider.value)))
        if Int(slider.value) == targetValue {
            score *= 2
            hitMessage = "WIN! You scored \(score)"
        }
        else {
            difference = abs(targetValue - Int(slider.value))
                if difference < 2 {
                    score += 50
                    hitMessage = "VERY Close - Extra points! You were off by \(difference). Score: \(score)"
                }
                else if difference < 10 {
                    hitMessage = "Close - Still Lost though! You were off by \(difference). Score: \(score)"
                }
                else
                {
                hitMessage = "Jeez - Way off! You were off by \(difference). Score \(score)"
                }
            }
        totalScore += score
        
        }

        
    }
    
    
 
    
    


