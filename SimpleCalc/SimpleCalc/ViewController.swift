//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Emil Berger on 28.04.19.
//  Copyright © 2019 Emil Berger. All rights reserved.
//

import UIKit

extension Double {
    var clean: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}

class ViewController: UIViewController {
    
    var isTypingNumber = false
    var firstNumber = 0.0
    var secondNumber = 0.0
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
        firstNumber = Double(resultLabel.text!)!
        operation = sender.currentTitle!
    }
    
    @IBAction func tappedCalc(_ sender: UIButton) {
        isTypingNumber = false
        var result = 0.0
        var dividedByZero = false
        secondNumber = Double(resultLabel.text!)!
        
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
            resultLabel.text = "Error"
        } else {
            resultLabel.text = String(result.clean)
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
