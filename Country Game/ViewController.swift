//
//  ViewController.swift
//  Country Game
//
//  Created by Nick Sagan on 22.10.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var winOrLoseLabel: UILabel!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        if sender.tag == correctAnswer {
            resultLabel.text = "Correct!"
            resultLabel.textColor = .systemGreen
            turns += 1
            score += 1
        } else {
            resultLabel.text = "No, it was not \(countries[correctAnswer].uppercased())"
            resultLabel.textColor = .systemRed
            score += 0
            turns += 1
        }
        
        ask()
        
    }
    var countries = [String]()
    var turns = 0
    var score = 0 {
        didSet {
            scoreLabel.text = "\(score) / \(turns)"
            
            if turns == 12 {
                button1.isHidden = true
                button1.isEnabled = false
                button2.isHidden = true
                button2.isEnabled = false
                button3.isHidden = true
                button3.isEnabled = false
                
                winOrLoseLabel.isEnabled = true
                winOrLoseLabel.isHidden = false
                
                if score >= 9 {
                    winOrLoseLabel.text = "Game over!\nYou win!\nYour score: \(score) of \(turns)"
                } else {
                    winOrLoseLabel.text = "Game over!\nYou lose!\nYour score: \(score) of \(turns)"
                }
                
            }
            
        }
    }
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        winOrLoseLabel.isEnabled = false
        winOrLoseLabel.isHidden = true
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        ask()
    }
    
    func ask() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased()
    }


}

