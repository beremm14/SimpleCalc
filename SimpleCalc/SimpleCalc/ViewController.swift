//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Emil Berger on 28.04.19.
//  Copyright © 2019 Emil Berger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isTypingNumber = false
    var firstNumber = 0
    var secondNumber = 0
    var operation = ""
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func tappedNumber(_ sender: UIButton) {
        let number = sender.currentTitle!
        
        if isTypingNumber {
            resultLabel.text = resultLabel.text! + number
        } else {
            resultLabel.text = number
            isTypingNumber = true
        }
    }
    
    @IBAction func tappedOperation(_ sender: UIButton) {
        isTypingNumber = false
        firstNumber = Int(resultLabel.text!)!
        operation = sender.currentTitle!
    }
    
    @IBAction func tappedCalc(_ sender: UIButton) {
        isTypingNumber = false
        let result: Double
        var dividedByZero = false
        secondNumber = Int(resultLabel.text!)!
        
        if (operation.elementsEqual("+")) {
            result = Double(firstNumber) + Double(secondNumber)
        } else if (operation.elementsEqual("-")) {
            result = Double(firstNumber) - Double(secondNumber)
        } else if (operation.elementsEqual("x")) {
            result = Double(firstNumber) * Double(secondNumber)
        } else if (operation.elementsEqual("÷")) {
            if (secondNumber == 0) {
                dividedByZero = true
            } else {
                result = Double(firstNumber) / Double(secondNumber)
            }
        }
        
        if (dividedByZero) {
            resultLabel.text = "Divide by 0 error"
        } else {
            if let intResult = Int(result!) {
                
            }
        }
    }
    
    @IBAction func tappedRestart(_ sender: UIButton) {
        resultLabel.text = "0"
        firstNumber = 0
        secondNumber = 0
        isTypingNumber = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

