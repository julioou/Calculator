//
//  ViewController.swift
//  Calculator
//
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    

    private var isFinishedTypingNumber: Bool = true
    
    private var displayValue: Double {
        get {
            guard let currentDisplayLabel = Double(displayLabel.text!) else { fatalError("Cannot convert the display label text to a Double.") }
            return currentDisplayLabel
        }
        set {
            displayLabel.text = String(newValue)
        }
    }

    private var calculator = CalculationLogic()
    
    //MARK: - Botões e funcionalidades de cálculo.
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true
        
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
            
            if let result = calculator.calculate(symbol: calcMethod) {
                displayValue = result
            }
            
        }
        
    }

    //MARK: - Botões de números e ponto.
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        //var numberDisplay = displayLabel.text!
        
        if let numValue = sender.currentTitle {
            
            if isFinishedTypingNumber == true {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            }
            else {
               
                if numValue == "." {
                    let isInt = floor(displayValue) == displayValue
                    if isInt == false {
                        return
                    }
                }
                
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
}

