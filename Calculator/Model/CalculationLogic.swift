//
//  CalculationLogic.swift
//  Calculator
//
//

import Foundation
import UIKit


struct CalculationLogic {
    
    private var number: Double?
    
    var intermediateCalculation: (firstNumber: Double, math: String)?
    
    //MARK: - Functionality
    
    //Função para recolher o número da tela.
    mutating func setNumber(_ number : Double) {
        self.number = number
    }
    //Função para definir qual operação esta sendo executada.
    mutating func calculate(symbol: String) -> Double? {
        if let n = number {
            if symbol == "+/-" {
                return n * -1
            }
            else if symbol == "AC" {
                return 0
            }
            else if symbol == "%" {
                return n / 100
            }
            else if symbol == "=" {
                return performMath(secondNumber: n)
            }
            else {
                intermediateCalculation = (firstNumber: n, math: symbol)
            }
        }
        return nil
    }
    
    //Função para performa as operações matemáticas.
    mutating private func performMath(secondNumber: Double) -> Double? {
        
        if let firstNumber = intermediateCalculation?.firstNumber,
            let operation = intermediateCalculation?.math {
            switch operation {
            case "+":
                print(firstNumber + secondNumber)
                return firstNumber + secondNumber
            case "-":
                print(firstNumber - secondNumber)
                return firstNumber - secondNumber
            case "×":
                print(firstNumber * secondNumber)
                return firstNumber * secondNumber
            case "÷":
                print(firstNumber / secondNumber)
                return firstNumber / secondNumber
            default:
                fatalError("The operation passed in does not match any of the cases.")
            }
        }
        return nil
    }
}
