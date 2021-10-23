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
            turns += 1
            score += 1
            score -= 1
            
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
        
        winOrLoseLabel.text = ""
        resultLabel.text = ""
        
        turns = 0
        score = 0
        
        button1.isHidden = false
        button1.isEnabled = true
        button2.isHidden = false
        button2.isEnabled = true
        button3.isHidden = false
        button3.isEnabled = true
        
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
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(viewDidLoad))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareGame))
    }
    
    @objc func shareGame() {
        let vc = UIActivityViewController(activityItems: ["http://mytestflagsgametryitgame.com", "My result is\(score) of \(turns)", "Try to beat me", UIImage(named: "us")!], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.leftBarButtonItem
        
        // Anything you want to exclude
        vc.excludedActivityTypes = [
            UIActivity.ActivityType.print
        ]
        
        present(vc, animated: true)
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

