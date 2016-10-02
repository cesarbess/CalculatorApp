//
//  ViewController.swift
//  Calculator
//
//  Created by Cesar Bess on 21/07/16.
//  Copyright © 2016 Cesar Bess. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var display: UILabel! //explicitamente abrindo a opcional na declaração, isso impede que eu precise usar ! toda vez que for usar o display durante o código
    private var isUserInTheMiddleOfTheTyping = false //é uma boa ideia usar variaveis com nomes longos se forem descritivos, desde que o swift vai sempre auto completar daqui em diante

    @IBAction private func touchDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if isUserInTheMiddleOfTheTyping{
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        }
            
        else {
            
            display.text = digit
        }
        
        isUserInTheMiddleOfTheTyping = true
    }
    
    private var displayValue: Double {  //propriedade computada. ao invez de ser apenas declarada, armazenada, ela é computada
        get {
            return Double(display.text!)! //retorna o valor do display toda vez que a pegar a variavel
        }
        
        set {
            display.text = String(newValue) //seta o texto do display toda vez que setar a variavel
        }
    }
    
    private var brain = CalculatorModel()
    
    @IBAction private func performOperation(sender: UIButton) {
        if isUserInTheMiddleOfTheTyping {
            brain.setOperand(displayValue)
            isUserInTheMiddleOfTheTyping = false
        }
        
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
        }
        displayValue = brain.result
    }
    
    
    
}

