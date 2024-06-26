//
//  ViewController.swift
//  project 2
//
//  Created by anshul on 02/04/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    
    
    var countries=[String]()
    var score=0
    var checkans=0
    var questionsAsked = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        countries += ["estonia", "france", "germany",
        "ireland", "italy", "monaco", "nigeria",
        "poland", "russia", "spain",
        "uk", "us"]
        
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
       
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor

        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil){
        countries.shuffle()
        checkans = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]),for: .normal)
        button2.setImage(UIImage(named: countries[1]),for: .normal)
        button3.setImage(UIImage(named: countries[2]),for: .normal)
        
        title = "\(countries[checkans].uppercased())" + " Score -\(score)"
        
        questionsAsked += 1
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title:String
        if sender.tag == checkans{
            title = "Correct"
            score += 1
        
        }else{
            title = "Wrong, That's the flag of \(countries[sender.tag].uppercased())"
            score -= 1
        }
        if(questionsAsked==10){
            let ac = UIAlertController(title: title, message: "Your score \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default,handler: askQuestion))
            present(ac,animated: true)
            score=0;
            questionsAsked=0
        }else{
            let ac = UIAlertController(title: title, message: "Your score \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default,handler: askQuestion))
            present(ac,animated: true)
        }
    }


}

